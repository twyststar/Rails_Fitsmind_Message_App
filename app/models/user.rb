class User < ApplicationRecord

  has_many :messages, dependent: :destroy

  has_many :sent_conversations, class_name: 'Conversation', foreign_key: 'sender_id'
  has_many :received_conversations, class_name: 'Conversation', foreign_key: 'receiver_id'

  validates_uniqueness_of :user_name, :case_sensitive => false
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def between(rec_id)
    @convos = Conversation.all
    @convos.each do |c|
      if (c.sender_id == self.id && c.receiver_id == rec_id) || (c.receiver_id == self.id && c.sender_id == rec_id)
        return c
      end

    end
  end
end
