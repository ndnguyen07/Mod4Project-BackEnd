class User < ApplicationRecord
    has_many :teams
    has_many :characters, through: :teams
end
