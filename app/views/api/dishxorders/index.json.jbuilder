json.array! @dishxorders do |dishxorder|
    json.dishxorder_id dishxorder.id
    json.order do
      json.order_id dishxorder.order.id
      json.order_time dishxorder.order.order_time
      json.order_date dishxorder.order.order_date 
      json.order_state dishxorder.order.order_state  
      # Mostrar información del cliente asociado a la orden
      json.client do
        json.client_id dishxorder.order.client.id
        json.client_full_name dishxorder.order.client.full_name
        json.client_address dishxorder.order.client.address
        json.client_email dishxorder.order.client.email
        json.client_state dishxorder.order.client.client_state
      end
    end
  
    json.dish do
      json.dish_id dishxorder.dish.id
      json.dish_name dishxorder.dish.dish_name
      json.price dishxorder.dish.price
      json.description dishxorder.dish.description
      json.image dishxorder.dish.dish_image
      json.dish_state dishxorder.dish.dish_state
    end
  end
