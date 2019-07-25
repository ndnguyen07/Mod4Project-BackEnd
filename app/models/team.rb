class Team < ApplicationRecord
    belong_to :user
    belong_to :character
end
