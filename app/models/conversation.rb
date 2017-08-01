class Conversation < ApplicationRecord

  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  has_many :messages, -> { order(created_at: :desc) }, dependent: :destroy

  validates :sender, uniqueness: {scope: :receiver}

  scope :participating, -> (user) do
    where("(conversations.sender_id = ? OR conversations.receiver_id = ?)", user.id, user.id)
  end

  # scope :between, -> (sender_id, receiver_id) do
  #   where(current_user_id: sender_id, receiver_id: receiver_id).or(where(current_user_id: receiver_id, receiver_id: sender_id)).limit(1)
  # end

  

  def other_user(current_user)
    if self.sender_id == current_user.id
      return self.receiver.user_name
    else
      return self.sender.user_name
    end
  end

  def with(current_user)
    sender == current_user ? receiver : sender
  end

end
