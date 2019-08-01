class TeamsController < ApplicationController
    skip_before_action :authorized
    def index
        team = Team.all
        render json: team

    end

    def create
        c1 = Character.create(name: team_params[:name], bio: team_params[:bio], img: team_params[:image], gender: team_params[:gender])
        team = Team.create(user_id: team_params[:user_id], character: c1)
        
        render json: team
    end

    private
    
    def team_params
        params.require(:team).permit(:name, :user_id, :image, :gender, :bio)
    end
end
