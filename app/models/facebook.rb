module Facebook
  include HTTParty
  base_uri 'https://graph.facebook.com'

  def self.get_location(user)
    fields = 'location'
    query = {query: {fields: fields, access_token: user.facebook_token}}
    self.get("/me", query)
  end

  def self.get_posts(user)
    fields = 'place,from,message,link'
    query = {query: 
      {fields: fields, access_token: user.facebook_token, limit: 200}
    }
    self.get("/me/posts", query)
  end
end
