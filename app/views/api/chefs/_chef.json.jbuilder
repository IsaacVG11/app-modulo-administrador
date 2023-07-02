json.extract! chef, :id, :full_name, :email, :password, :created_at, :updated_at
json.url chef_url(chef, format: :json)
