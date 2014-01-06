require 'sinatra'
require 'foursquare2'
require 'json'

enable :sessions

# as found on https://foursquare.com/oauth/
CLIENT_ID = ENV['FOURSQUARE_CLIENT_ID']
CLIENT_SECRET = ENV['FOURSQUARE_CLIENT_SECRET']
CALLBACK_PATH = 'http://localhost:4567/oauth/callback'

get '/oauth/callback' do
  if params[:code]
    access_token_body =  Faraday.get "https://foursquare.com/oauth2/access_token?client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}&grant_type=authorization_code&redirect_uri=http://localhost:3000/&code=#{params[:code]}"

    access_token = JSON.parse(access_token_body.body)["access_token"]
    session[:access_token] = access_token
    redirect "/feed"
 #   Foursquare2::Client.new(oauth_token: session[:access_token])
    #html = "#{@foursquare.user_checkins.items.first}"
  else
    redirect "/"
  end
end


get '/' do
  '<a href="/oauth/connect">Connect with Foursquare</a>'
end

get "/oauth/connect" do
  redirect authorize_url
end

get "/feed" do
  html = "<h1>#{client.user('self').firstName}'s Feed</h1>
          <h2>All checkins:</h2>"
  
  #client.user_checkins.to_json

  client.user_checkins.items.each do |item|
    html << "<li><p><strong>#{item.venue["name"]}</strong> | 
            #{item.venue["location"]["city"]}</p>
            <p>Map it: #{item.venue["location"]["lat"]}, #{item.venue["location"]["lng"]}</p>
            <p><strong>It happened at:</strong> #{Time.at(item.createdAt)}</p></li>"
  end

  html
end

def authorize_url
   "https://foursquare.com/oauth2/authenticate?client_id=#{CLIENT_ID}&response_type=code&redirect_uri=#{CALLBACK_PATH}"
end

def client
  Foursquare2::Client.new(oauth_token: session[:access_token])
end
