class PostsController < ApplicationController
  # TODO: handle errors
  def index
    user = current_user
    if user
      @latitude, @longitude = user.update_location
      posts = Facebook.get_posts(user)
      post_data = posts['data']
      # TODO: move this logic out of controller
      @posts_with_location = post_data.reduce({data: []}) do |posts, post| 
        if post['place']
          location = post['place']['location']
          coords = [location['latitude'], location['longitude']]
          author = post['from']['name']
          message = post['message']
          post_hash = {coords: coords, author: author, message: message}
          posts[:data] << post_hash
        end
        posts
      end

      @posts_with_location
    end
  end
end
