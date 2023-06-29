module DishesHelper
    def dish_states_helper
        Dish.dish_states.keys.map do |dish_state|
            [t("activerecord.attributes.Dish.dish_states.#{dish_state}"), dish_state]
        end
    end
end
