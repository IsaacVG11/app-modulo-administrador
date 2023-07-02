json.extract! state, :id, :ontime, :overtime, :late, :created_at, :updated_at
json.url state_url(state, format: :json)
