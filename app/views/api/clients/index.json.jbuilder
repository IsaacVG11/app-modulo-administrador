json.array! @clients do |client|
    json.client_id client.id
    json.client_full_name client.full_name
    json.email client.email
    json.address client.address
    json.client_state client.client_state
end
