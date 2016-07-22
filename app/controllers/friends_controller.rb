class FriendsController < ApplicationController
  def index
    user = current_user
    if user
      @latitude, @longitude = user.update_location
      post_data = Facebook.get_posts(user)["data"]
      @post_locations = post_data.reduce([]) do |posts_with_location, post| 
        if post["place"]
          location = post["place"]["location"]
          coords = [location["latitude"], location["longitude"]]
          posts_with_location << coords
        end
        posts_with_location
      end
    end
  end
end
