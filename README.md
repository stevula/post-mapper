# PostMapper
When you log in through Facebook, PostMapper fetches your post history from Facebook and maps the locations of those posts using geodata. Obviously, it will
only map those posts that had location data enabled. It uses the Facebook Graph
API and Google Maps JavaScript API to accomplish this. Only name and Facebook ID
are stored in the database (I don't retain any post data).

## Key Dependencies
* Rails 5.0.0
* Postgresql
* Ruby 2.3.1
* Bundler gem

## Installation
1. Clone the repository.
```git clone https://github.com/stevula/post-mapper.git```
2. Navigate to the application directory and bundle install the gems:
```bundle install```
3. Initialize the database:
```rake db:create & rake db:migrate```
4. Set environment variables. You will need to register your app and obtain your
own API keys from Facebook and Google. The app expects these ENV variables:
```
facebook_app_id
facebook_secret
google_api_key
```

## Usage
Simply log in through Facebook and the map will update with your post locations.
Only posts with geodata enabled will be displayed on the map.

## Tests
Run this command to execute the test suite:
```bundle exec rake spec```
