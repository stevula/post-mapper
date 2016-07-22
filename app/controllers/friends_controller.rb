class FriendsController < ApplicationController
  def index
    user = current_user
    if user
      @latitude, @longitude = user.update_location
      post_data = Facebook.get_posts(user)["data"]
      @post_locations = post_data.reduce([]) do |post_locations, post| 
        if post["place"]
          location = post["place"]["location"]
          coords = [location["latitude"], location["longitude"]]
          post_locations << coords
        end
        post_locations
      end
    end
  end
end
