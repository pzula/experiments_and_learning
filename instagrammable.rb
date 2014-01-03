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


def client
  Instagram.client(:access_token => session[:access_token])
end

def user(uid=nil)
  uid == nil ? client.user : client.user(uid)
end

def get_recent_images_by_user(uid=nil)
  uid == nil ? client.user_recent_media : client.user_recent_media(uid)
end


