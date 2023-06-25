class Client < ApplicationRecord
    has_many :orders

    validates :full_name, presence: true
    validates :address, presence: true
    validates :email, presence: true, format: { with: /\A[\w+-.]+@[a-z\d-]+(.[a-z]+)*.[a-z]+\z/i }
    validates :password, presence: true
    validates :client_state, presence: true

    enum client_state: {'enable': 1, 'disable': 0}
end
