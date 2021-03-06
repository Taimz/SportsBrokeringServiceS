class TeamsController < ApplicationController

 def index
   @all_types = Team.all_types
	userID = session[:currUserID] || 0
	if userID != 0
		@user = User.find(userID)
	end
	@selected_types = params[:type] || {}
	if @selected_types != {}
		if @selected_types.size == 1
			vals = @selected_types.map { |r| if r.first == 'International'
															1
														else
															0
														end}
			query = vals.map { |r| "team_type is '#{r}'"}
			@teams = Team.where(query)
			return @teams
		end
	end
   @teams = Team.order(team_type: :desc)
 end

end
