class MessagesController < ApplicationController
  before_action :find_conversation!

  def new
    @message = Message.new()
  end
  def create
    @message = current_user.messages.build(message_params)
    if current_user.between((params['receiver_id']).to_i)
      @conversation = current_user.between((params['receiver_id']).to_i)
    elsif current_user.between(current_user.id)
      @conversation = current_user.between(current_user.id)
    else
      @conversation = Conversation.create!(sender_id: current_user.id, receiver_id: (params['receiver_id']))
    end
    @message.conversation_id = @conversation.id
    @message.save!

    redirect_to conversation_path(@conversation)
  end

  private

  def message_params
    params.require(:message).permit(:content, :sender_id, :receiver_id)
  end

  def find_conversation!
    @conversation = Conversation.find_by(id: params[:conversation_id])
  end
end
