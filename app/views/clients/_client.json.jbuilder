json.extract! client, :id, :full_name, :address, :email, :password, :created_at, :updated_at
json.url client_url(client, format: :json)
