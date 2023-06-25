module OrdersHelper
    def order_state
        Order.order_states.keys.map do |order_state|
            [t("activerecord.attributes.Order.order_states.#{order_state}"), order_state]
        end
    end
end
