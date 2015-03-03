class CustomsController < ApplicationController
  before_filter :authenticate, :except => [:create, :show, :new]

  def index
    @orders = Custom.all
  end
  def create
    @custom = Custom.new(custom_params)
    @custom.pass_key = make_passcode
    if @custom.save
      redirect_to action: "show", id: @custom.id
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

  def destroy

    @order = Custom.find(params[:id])
    @order.destroy
    redirect_to customs_path, notice: 'Project was successfully deleted.'
  end

  def show
    @order = Custom.find(params[:id])
    @unlocked = false
    if params['code'] && params['code'] == @order.pass_key
      @order = Custom.find(params[:id])
      @unlocked = true
    elsif params['code'] && params['code'] != @order.pass_key
      redirect_to action: "show", id: @order.id
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
      @authenticated = username == "foo" && password == "bar"
    end
  end

  def authenticated?
    @authenticated
  end
  helper_method :authenticated?
end
