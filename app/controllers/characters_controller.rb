class CharactersController < ApplicationController
    skip_before_action :authorized
    def index
        @characters = Character.queryAllCharacters
        render json: @characters
    end
end
