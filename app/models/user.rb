class User < ApplicationRecord
  class << self
    def from_omniauth(auth_hash)
      user = find_or_create_by(facebook_id: auth_hash['facebook_id'])
      user.name = auth_hash['info']['name']
      user.facebook_token = auth_hash['credentials']['token']
      user.facebook_token_expires_at = auth_hash['credentials']['expires_at']
      user.save!
      user
    end
  end
end
