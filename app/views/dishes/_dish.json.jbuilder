json.extract! dish, :id, :dish_name, :description, :dish_image, :created_at, :updated_at
json.url dish_url(dish, format: :json)
