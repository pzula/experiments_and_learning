require "sinatra"
require "instagram"
require "json"

enable :sessions

CALLBACK_URL = "http://localhost:4567/oauth/callback"

Instagram.configure do |config|
  config.client_id = ENV['INSTA_CLIENT_ID']
  config.client_secret = ENV['INSTA_CLIENT_SECRET']
end

get "/" do
  '<a href="/oauth/connect">Connect with Instagram</a>'
end

get "/oauth/connect" do
  redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
end

get "/oauth/callback" do
  response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  session[:access_token] = response.access_token
  redirect "/feed"
end

get "/feed" do
  html = "<h1>#{user.username}'s recent photos</h1>"

  get_recent_images_by_user.each do |media_item|
     html << "<img src='#{media_item.images.low_resolution.url}'>"
  end

  html
end

get "/feed/:id" do |id|
  html = "<h2>#{user(id).username}'s recent photos</h2>  "

  get_recent_images_by_user(id).each do |media_item|
    html << "<img src='#{media_item.images.low_resolution.url}'>"
  end
  html
end

get "/users/:username" do |username|
  user = user_by_username(username)
  html = "<h2>#{user[0]["username"]}'s recent photos</h2>  "

  get_recent_images_by_username(username).each do |media_item|
    html << "<img src='#{media_item.images.low_resolution.url}'>"
  end
  html
end

get "/location/:location_id" do |location_id|
  html = "<h2>Recent photos at #{get_location(location_id).name}</h2>"
  get_recent_images_by_location(location_id).each do |media_item|
    html <<  "<img src='#{media_item.images.low_resolution.url}'>"
  end
  html
end

get "/popular" do
   html = "<h2>Popular photos</h2>"
  get_popular.each do |media_item|
    html <<  "<img src='#{media_item.images.low_resolution.url}'>"
  end
  html
end

get "/foursquare/:id" do |id|
  location = get_location_by_foursquare(id)
  name = location[0]["name"]
  html = "<h2>Recent photos near #{name}</h2>"
  get_recent_images_by_foursquare(id).each do |media_item|
    html <<  "<img src='#{media_item.images.low_resolution.url}'>"
  end
  html
end

def client
  Instagram.client(:access_token => session[:access_token])
end

def user(uid=nil)
  uid == nil ? client.user : client.user(uid)
end

def user_by_username(username)
  client.user_search(username)
end

def get_recent_images_by_user(uid=nil)
  uid == nil ? client.user_recent_media : client.user_recent_media(uid)
end

def get_recent_images_by_username(username)
  user = client.user_search(username)
  get_recent_images_by_user(user[0]["id"])
end

def get_location(location_id)
  client.location(location_id)
end

def get_recent_images_by_location(location_id)
  client.location_recent_media(location_id)
end

def get_location_by_foursquare(id)
  client.location_search(id)
end

def get_recent_images_by_foursquare(id)
  location = get_location_by_foursquare(id)
  latitude = location[0]["latitude"]
  longitude = location[0]["longitude"]
  client.media_search(latitude, longitude)
end

def get_popular
  client.media_popular
end
