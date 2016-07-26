class User < ApplicationRecord
  validates :name, presence: true

  class << self
    def from_omniauth(auth_hash)
      user = find_or_create_by(facebook_id: auth_hash['uid'])
      user.name = auth_hash['info']['name']
      user.facebook_token = auth_hash['credentials']['token']
      expires_at_timestamp = auth_hash['credentials']['expires_at']
      user.facebook_token_expires_at = Time.at(expires_at_timestamp).to_datetime
      user.save!
      user
    end
  end

  def update_location
    location_data = Facebook.get_location(self)
    location = location_data['location']['name']
    geodata = Geokit::Geocoders::MultiGeocoder.geocode(location)
    return geodata.lat, geodata.lng
  end
end
