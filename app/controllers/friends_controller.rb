class FriendsController < ApplicationController
  def index
    @user = current_user
    if @user
      location_data = Facebook.get_location(@user)
      location = location_data['location']['name']
      geodata = Geokit::Geocoders::MultiGeocoder.geocode(location)
      @latitude, @longitude = geodata.lat, geodata.lng
    end
  end
end
