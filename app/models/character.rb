class Character < ApplicationRecord
    has_many :teams
    has_many :users, through: :teams
end

 def self.getAllCharacters
    url = 