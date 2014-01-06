### Experiments with the Foursquare API

#### Quick overview:
- OAuth and Foursquare are special. Getting them to play together ain't pretty
- You can try all the gems you want. You're probably going to just handle the HTTP requests yourself by the time you're done.
- I like using Faraday for the HTTP requests. Use whatever you fancy

### Use case
- You want to figure out how the heck to use OAuth with Foursquare

### How-to
- Get your API keys from <http://api.foursquare.com>
- Go to your `~/.bash_profile` and add your ENV variables so you don't commit your keys to a repo:
  - `export FOURSQUARE_CLIENT_ID=xxxxxxxx`, where `xxxxxxxx` is your given `CLIENT_ID`
  - `export FOURSQUARE_CLIENT_SECRET=xxxxxxxx`, where `xxxxxxx` is your given `CLIENT_SECRET`
- Reload your terminal using `source ~/.bash_profile`
- `git clone git@github.com:pzula/foursquare-experiments.git`
- `cd foursquare-experiements`
- `gem install sinatra && gem install foursquare2 && gem install json` (unless you already have it all)
- `ruby main.rb` should start the Sinatra server on the default port of `4567`
- Visit <http://localhost:4567>
- Click the Connect with Foursquare link
- You should be redirected to <http://localhost:4567/feed>, where you should see your checkins by name, time, city and GPS coordinates.
