class Facebook
  include HTTParty
  base_uri 'https://graph.facebook.com'

  class << self
    def get_location(user)
      fields = 'location'
      query = {query: {fields: fields, access_token: user.facebook_token}}
      self.get("/me", query)
    end

    def get_friends(user, friends_of="me")
      query = {query: {access_token: user.facebook_token, limit: 20}}
      self.get("/#{friends_of}/friends", query)
    end

    def get_posts(user)
      fields = 'place,from,message,link'
      query = {query: 
        {fields: fields, access_token: user.facebook_token, limit: 200}
      }
      self.get("/me/posts", query)
    end
  end
end
