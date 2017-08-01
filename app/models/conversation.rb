class Conversation < ApplicationRecord

  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  has_many :messages, -> { order(created_at: :desc) }, dependent: :destroy

  validates :sender, uniqueness: {scope: :receiver}

  scope :participating, -> (user) do
    where("(conversations.sender_id = ? OR conversations.receiver_id = ?)", user.id, user.id)
  end

  def with(current_user)
    sender == current_user ? receiver : sender
  end

  # def participates?(user)
  #   sender == user || receiver == user
  # end
end
