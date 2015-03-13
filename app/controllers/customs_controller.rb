class CustomsController < ApplicationController
  before_filter :authenticate, :except => [:create, :show, :new]

  def index
    @orders = Custom.all
  end
  def create
    @custom = Custom.new(custom_params)
    @custom.pass_key = make_passcode
    @custom.status = "pending"
    @custom.create_bill
    @custom.bill.pass_key = @custom.pass_key
    if @custom.save
          # UserMailer.notify(@custom).deliver
          redirect_to custom_path(@custom, :code => @custom.pass_key)
    else
      render 'new'
    end
  end

  def update
    @custom = Custom.find(params[:id])
    if @custom.update(custom_params)
      redirect_to custom_path(@custom, :code => @custom.pass_key)
    else
      render :edit, notice: "failure"
    end
  end

  def new
    @custom = Custom.new
  end

  def edit
    @custom = Custom.find(params[:id])
  end

  # def destroy

  #   @order = Custom.find(params[:id])
  #   @order.destroy
  #   redirect_to customs_path, notice: 'Project was successfully deleted.'
  # end

  def show
    @order = Custom.find(params[:id])
    @bill = @order.bill
    @unlocked = false
    if params['code'] && params['code'] == @order.pass_key
      @order = Custom.find(params[:id])
      @unlocked = true
    else
      redirect_to root_path
    end
  end

  private
  def make_passcode
    key = ''
    key += ['lemon','apple','orange','banana','melon','lime'].sample
    4.times do |i|
      key += rand(0..9).to_s
    end
    key
  end
  def custom_params
    params.require(:custom).permit(:canvas_size, :name, :info, :email, :status)
  end

  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      session[:admin] = (username == ENV['USERNAME'] && password == ENV['PASSWORD'])
    end
  end
end
