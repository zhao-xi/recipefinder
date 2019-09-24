require 'httparty'
class Recipe < ActiveRecord::Base
    include HTTParty
	default_options.update(verify: false) # Turn off SSL verification
	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
	base_uri 'http://food2fork.com/api'
	ENV["FOOD2FORK_KEY"] = 'd1998834a6670834265bcac40a30ec34'
	default_params key: ENV["FOOD2FORK_KEY"]
	format :json

	def self.for keyword
		get("/search", query: {q: keyword})["recipes"]
	end
end
