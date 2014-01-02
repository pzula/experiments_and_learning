require "sinatra"
require "instagram"
require "faraday"
require "json"
#require "better_errors"

#configure :development do
  #use BetterErrors::Middleware
  #BetterErrors.application_root = __dir__
#end

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
  @response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  session[:access_token] = @response.access_token
  redirect "/feed"
end

get "/feed" do
  client = Instagram.client(:access_token => session[:access_token])
  user = client.user

  html = "<h1>#{user.username}'s recent photos</h1>"
  for media_item in client.user_recent_media
    html << "<img src='#{media_item.images.thumbnail.url}'>"
  end
  html
end

get "/recent/:id" do |id|
  html = "<h2>User's recent photos</h2>  #{Instagram.user_recent_media(id).to_json}"

  #Instagram.user_recent_media(id).each do |media_item|
   #html << "<li>#{media_item.link}</li>"
  #end

  get_recent_photos_by_uid(id)

end

#sample user id that is not me: 35087619

def get_recent_photos_by_uid(uid)
 response = Faraday.get("https://api.instagram.com/v1/users/#{uid}/media/recent?#{session[:access_token]}")
 data = JSON.parse(response.body)
end
