class CustomsController < ApplicationController
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
  end

  def new
    @custom = Custom.new
  end

  def edit
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
    params.require(:custom).permit(:canvas_size, :name, :info, :email)
  end
end
