class MessagesController < ApplicationController
  def create
  	@custom = Custom.find(params[:custom_id])
    @message = @custom.messages.create(message_params)
    redirect_to :back
  end
  private
    def message_params
      params.require(:message).permit(:author, :body, :email, :image)
    end
end
