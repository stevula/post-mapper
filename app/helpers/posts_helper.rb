module PostsHelper
  def filter_posts_with_location(post_data)
    post_data.reduce({data: []}) do |posts, post| 
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
  end
end
