# Instragrammable
## A simple Sinatra app to explore the capabilities of the Instagram API

### Installation & Usage
- Clone the repository `git clone git@github.com:pzula/instagram-experiments.git`
- `cd instagram-experiments`
- Unless you already have these: `gem install sinatra && gem install instagram && gem install json`
- `ruby instagrammable.rb` will start the Sinatra server, defaulting to port `4567`
- Visit <http://localhost:4567> and click the "Connect with Instragram" link
- Follow through the authorization of the app with Instagram
- On your return page, you will see your own Instagram feed

#### Get the most popular photos on Instagram
- Visit <http://localhost:4567/popular>

#### Get the feed of another user by user id
- Visit <http://localhost:4567/feed/777>, where `777` is the user's id

#### Get the feed of another user by username
- Visit <http://localhost:4567/users/nervousdogcoffeebar>, where `nervousdogcoffeebar` is the username

#### Get the feed of a location by id
- Visit <http://localhost:4567/location/1>, where `1` is the Instagram location ID

#### Get the feed nearby a location by Foursquare ID
- Visit <http://localhost:4567/foursquare/4c390891ae2da593dadc01c6>, where `4c390891ae2da593dadc01c6` is the Foursquare ID (found by visiting a location on Foursquare and taking the last section of the URL)

