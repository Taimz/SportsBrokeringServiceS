class MatchsController < ApplicationController
	def index
		@all_types = Match.all_types
		@matches = Match.all
	end
end