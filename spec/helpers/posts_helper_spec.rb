require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe PostsHelper, type: :helper do
  post_data = [
    {"place" => {"id"=>"111574348882798", "name"=>"Pretty Lady", "location"=>{"city"=>"Oakland", "country"=>"United States", "latitude"=>37.8140311, "longitude"=>-122.29204, "state"=>"CA", "street"=>"1733 Peralta St", "zip"=>"94607-1615"}}, "from"=>{"name"=>"Steven Broderick", "id"=>"859989470802057"}, "id"=>"859989470802057_849871311813873"}, 
    {"from"=>{"name"=>"Steven Broderick", "id"=>"859989470802057"}, "message"=>"Wow...", "link"=>"https://www.facebook.com/photo.php?fbid=842860439181627&set=a.102182183249460.2329.100003730350277&type=3", "id"=>"859989470802057_842860462514958"}, 
    {"from"=>{"name"=>"Steven Broderick", "id"=>"859989470802057"}, "message"=>"Daniel 59, had “Call Me Maybe” pumping on his headphones and was heading over to a blind date...\n\n#NotTheOnion", "link"=>"http://logo.to/1WIN94n", "id"=>"859989470802057_838317262969278"}, 
    {"place"=>{"id"=>"303370693171890", "name"=>"Paulie's Pickling", "location"=>{"city"=>"San Francisco", "country"=>"United States", "latitude"=>37.7394, "longitude"=>-122.41799, "state"=>"CA", "street"=>"331 Cortland Ave", "zip"=>"94110"}}, "from"=>{"name"=>"Steven Broderick", "id"=>"859989470802057"}, "message"=>"Honey cardamom soda... So good", "id"=>"859989470802057_834466426687695"}, 
    {"from"=>{"name"=>"Steven Broderick", "id"=>"859989470802057"}, "message"=>"I find this hilarious. OpenTable for Surgeons actually sounds like a great idea for increasing hospital utilization... until you think about it a little more.", "link"=>"http://itsthisforthat.com/", "id"=>"859989470802057_833966633404341"}
  ]

  describe '#filter_posts_with_location' do
    it 'filters the post_data to include only posts with location info' do
      filtered_posts = helper.filter_posts_with_location(post_data)[:data]
      expect(filtered_posts.length).to be 2
      filtered_post_ids = filtered_posts.map {|post| post[:coords]}
      expect(filtered_post_ids).to match_array [[37.8140311, -122.29204], [37.7394, -122.41799]]
    end
  end
end
