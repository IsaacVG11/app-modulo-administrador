class Dish < ApplicationRecord
    has_many :dishxorders
    has_many :orders, through: :dishxorders

    attr_accessor :image 
    validates :dish_name, presence: true
    validates :description, presence: true
    validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,1})?\z/ }, numericality: { greater_than_or_equal_to: 0 }
    validates :dish_image, presence: true
    validates :dish_state, presence: true
    
    enum dish_state: {'enable': 1, 'disabled': 0}
end
