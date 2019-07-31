class Character < ApplicationRecord
    has_many :teams
    has_many :users, through: :teams

    def self.queryAllCharacters
        url = "https://comicvine.gamespot.com/api/characters?api_key=#{ENV["COMIC_VINE_KEY"]}&offset=102&format=json&field_list=id,name,deck,gender,image"
        json = JSON.parse(RestClient.get url, {content_type: :json, accept: :json})
    end

    # def self.queryAllCharacters
    #     url = "https://superheroapi.com/api/#{ENV['SUPER_HERO_KEY']}/id"
    #     json = JSON.parse(RestClient.get url, {content_type: :json, accept: :json})
    #     end
    # end
        
end