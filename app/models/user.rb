class User < ApplicationRecord
    has_many :teams
    has_many :characters, through: :teams

    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
end
