require "github_api"
require "sinatra"
require "faraday"
require "json"

  get '/' do
    mygit = MyGit::Gitter.new
    response = mygit.connection.get("2ebc4af4cd...c9970e6649")
    JSON.parse(response.body)
  end


  module MyGit
    class Gitter

      attr_reader :connection

      def initialize
        @connection = Faraday.new("https://api.github.com/repos/pzula/dotfiles/compare") do |faraday|
          faraday.request  :url_encoded
          faraday.response :logger
          faraday.adapter  Faraday.default_adapter
        end
      end

    end
  end
