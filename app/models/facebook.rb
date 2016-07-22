class Facebook
  include HTTParty
  base_uri 'https://graph.facebook.com'

  class << self
    def get_location(user)
      query = {query: {fields: 'location', access_token: user.facebook_token}}
      self.get("/me", query)
    end

    def get_friends(user)
      query = {query: {access_token: user.facebook_token}}
      self.get("/me/friends", query)
    end

    def get_posts(user)
      query = {query: {access_token: user.facebook_token, fields: 'place'}}
      self.get("/me/posts", query)
    end
  end
end
