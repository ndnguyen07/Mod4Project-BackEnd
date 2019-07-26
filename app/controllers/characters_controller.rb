class CharactersController < ApplicationController

    def index
        @characters = Character.queryAllCharacters
        render json:@characters
    end
end
