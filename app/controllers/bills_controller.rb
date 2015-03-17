class BillsController < ApplicationController
	before_filter :authenticate, :except => [:charge, :show, :update]
	protect_from_forgery except: :charge
	def new
	end
	def edit
	    @bill = Bill.find(params[:id])
	end

	def update
		@custom = Custom.find(params[:id])
	    if @custom.bill.update(bill_params)
	      redirect_to :back
	    else
	      redirect_to :back, notice: "failure"
	    end
	end

	def charge
	  # Amount in cents
	  @bill = Bill.find(params[:id])
	  @custom = @bill.custom
	 
	  customer = Stripe::Customer.create(
	    :email => @custom.email,
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => ((@bill.subtotal + @bill.tip)*100).to_i,
	    :description => 'Dipndap Order',
	    :currency    => 'usd'
	  )
	  @bill.is_paid = true
	  @bill.save!
	  UserMailer.paid_notify(@custom).deliver
	  @message = Message.create(author: "dipndap.com bot", body: "Order has been paid.", custom_id: @custom.id)
	  @message.save!
	  rescue Stripe::CardError => e
	  flash[:error] = e.message

	  respond_to do |format|
		  format.js # actually means: if the client ask for js -> return file.js
		end
	end

	def show
		@bill = Bill.find(params[:id])
		if params['code'] && params['code'] == @bill.pass_key
	      redirect_to custom_path(@bill.custom, :code => @bill.custom.pass_key), notice: 'Cannot currently pay bill.' if @bill.is_paid == true || @bill.payable == false
	    else
	      redirect_to root_path
	    end
	end
	private
	def bill_params
      params.require(:bill).permit(:tip, :total, :subtotal, :is_paid, :payable, :pass_key)
    end
    protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      session[:admin] = (username == ENV['USERNAME'] && password == ENV['PASSWORD'])
    end
  end
end
