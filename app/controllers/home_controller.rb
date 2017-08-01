class HomeController < ApplicationController
  def index
    @users = User.all
    @conversations = Conversation.participating(current_user)
  end
end
