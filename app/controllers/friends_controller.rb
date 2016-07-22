class FriendsController < ApplicationController
  def index
    if current_user
      # p Facebook.get_friends(current_user)
      # p Facebook.get_posts(current_user)
    end
  end
end
