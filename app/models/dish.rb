class Dish < ApplicationRecord
    has_many :dishxorders
    has_many :orders, through: :dishxorders

    validates :dish_name, presence: true
    validates :description, presence: true
    validates :price, presence: true
    validates :dish_image, presence: true
    validates :dish_state, presence: true
    
    enum dish_state: {'enable': 1, 'disabled': 0}
end
