class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 has_one :profile

 after_create :user_profile
 
  def user_profile
    @user = User.last
    @profile = Profile.create!(user_id: @user.id)
  end

end
