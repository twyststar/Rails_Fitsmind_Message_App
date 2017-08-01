class MessagesController < ApplicationController
  before_action :find_conversation!

  def create
    @message = current_user.messages.build(message_params)
    @message.conversation_id = @conversation.id
    @message.save!

    redirect_to conversation_path(@conversation)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def find_conversation!
    @conversation = Conversation.find_by(id: params[:conversation_id])
  end
end
