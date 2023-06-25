class Order < ApplicationRecord
    belongs_to :client
    has_many :dishxorders
    has_many :dishes, through: :dishxorders

    validates :order_time, presence: true
    validates :order_date, presence: true
    validates :order_state, presence: true

    enum order_state: {'onTime': 0, 'overTime': 1, 'late': 2, 'canceled': 3, 'delivered': 4}
end
