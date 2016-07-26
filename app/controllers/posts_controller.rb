class PostsController < ApplicationController
  include PostsHelper

  def index
    user = current_user
    if user
      @latitude, @longitude = user.update_location
      posts = Facebook.get_posts(user)
      post_data = posts['data']
      @posts_with_location = filter_posts_with_location(post_data)
    end
  end
end
