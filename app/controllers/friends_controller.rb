class FriendsController < ApplicationController
  def index
    user = current_user
    if user
      location_data = Facebook.get_location(user)
      location = location_data['location']['name']
      geodata = Geokit::Geocoders::MultiGeocoder.geocode(location)
      @latitude, @longitude = geodata.lat, geodata.lng
      user.attributes = {latitude: @latitude, longitude: @longitude}
      if user.save
        # TODO
      else
        # TODO
      end
    end
  end
end
