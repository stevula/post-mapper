module PostsHelper
  def filter_posts_with_location(post_data)
    post_data.reduce({data: []}) do |posts, post|
      if post['place']
        location = post['place']['location']
        coords = [location['latitude'], location['longitude']]
        location_name = post['place']['name']
        location_city = post['place']['location']['city']
        author = post['from']['name']
        message = post['message'] || ""
        post_hash = {
          coords: coords, 
          location_name: location_name, 
          location_city: location_city, 
          author: author, 
          message: message
        }
        posts[:data] << post_hash
      end
      posts
    end
  end
end
