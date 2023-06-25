json.array! @dishes do |dish|
    json.dish_id dish.id
    json.dish_name dish.dish_name
    json.price dish.price
    json.description dish.description
    json.image dish.dish_image
    json.dish_state dish.dish_state
end
