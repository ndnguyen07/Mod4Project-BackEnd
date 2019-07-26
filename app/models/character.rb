class Character < ApplicationRecord
    has_many :teams
    has_many :users, through: :teams

    def self.queryAllCharacters
        url = "https://comicvine.gamespot.com/api/characters?api_key=#{ENV["COMIC_VINE_KEY"]}&format=json&field_list=id,name,real_name,image,gender"
        json = JSON.parse(RestClient.get url, {content_type: :json, accept: :json})
    end
end