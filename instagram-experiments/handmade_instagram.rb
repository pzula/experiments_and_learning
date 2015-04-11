require "instagram"

# All methods require authentication (either by client ID or access token).
# To get your Instagram OAuth credentials, register an app at http://instagr.am/oauth/client/register/
Instagram.configure do |config|
  config.client_id = ENV['INSTA_CLIENT_ID'] 
  config.access_token = ENV['INSTA_CLIENT_SECRET']
end

# Get a list of a user's most recent media
puts Instagram.user_recent_media(777)

# Use pagination data from a response to get the next page
page_1 = Instagram.user_recent_media(777)
page_2_max_id = page_1.pagination.next_max_id
page_2 = Instagram.user_recent_media(777, :max_id => page_2_max_id ) unless page_2_max_id.nil?

# Get the currently authenticated user's media feed
puts Instagram.user_media_feed

# Get a list of recent media at a given location, in this case, the Instagram office
puts Instagram.location_recent_media(514276)

# Get a list of media close to a given latitude and longitude
puts Instagram.media_search("37.7808851","-122.3948632")

# Get a list of the overall most popular media items
puts Instagram.media_popular

# Search for users on instagram, by name or username
puts Instagram.user_search("shayne sweeney")

# Search for a location by lat/lng
puts Instagram.location_search("37.7808851","-122.3948632")

# Search for a location by Fousquare ID (v2)
puts Instagram.location_search("3fd66200f964a520c5f11ee3")
