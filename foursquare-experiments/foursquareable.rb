require 'sinatra'
require 'json'
require 'foursquare2'
require 'oauth2'

enable :sessions

CALLBACK_URL = "http://localhost:4567/oauth/callback"

CLIENT_ID = ENV['FOURSQUARE_CLIENT_ID']
CLIENT_SECRET = ENV['FOURSQUARE_CLIENT_SECRET']

def client
  OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, 
                     :site => 'https://foursquare.com/v2/',
                     :request_token_path => "/oauth2/request_token",
                     :access_token_path => "/oauth2/access_token",
                     :authorize_path => "/oauth2/authenticate?response_type=code",
                     :parse_json => true
                    )
end

get "/" do 
  '<a href="/oauth/connect">Connect with FourSquare</a>'
end

get "/oauth/connect" do
  client.auth_code.authorize_url(:redirect_uri => CALLBACK_URL)
  token = client.auth_code.get_token(params[:code], :redirect_uri => CALLBACK_URL)
  response = token.get('https://foursquare.com/oauth2/access_token', :params => { 'client_id' => CLIENT_ID, 'client_secret' => CLIENT_SECRET, 'grant_type' => 'authorization_code', 'redirect_url' => CALLBACK_URL, 'code' => params[:code] })
  response.class.name
  # => OAuth2::Response
end
