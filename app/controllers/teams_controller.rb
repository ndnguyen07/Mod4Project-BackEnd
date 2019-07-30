class TeamsController < ApplicationController
    def create
        team = Team.create(team_params)
        render json: team
    end

    private
    
    def team_params
        params.require(:team).permit(:name, :user_id, :character_id)
    end
end
