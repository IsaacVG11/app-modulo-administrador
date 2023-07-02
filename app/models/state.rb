class State < ApplicationRecord
    validates :ontime , presence: true
    validates :overtime , presence: true
    validates :late, presence: true
end
