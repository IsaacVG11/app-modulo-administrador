json.array! @orders do |order|
    json.order_id order.id
    json.order_time order.order_time
    json.order_date order.order_date 
    json.order_state order.order_state
    json.client do
        json.full_name order.client.full_name
        json.address order.client.address
        json.email order.client.email
        json.client_state order.client.client_state
    end
end
