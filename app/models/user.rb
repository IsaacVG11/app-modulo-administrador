class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, format: { with: /\A[\w+-.]+@[a-z\d-]+(.[a-z]+)*.[a-z]+\z/i }
    validates :password, presence: true
    validates :role, presence: true
    
    enum role: {'administrator': 1, 'chef': 0}
end
