json.array! @chefs do |chef|
    json.chef_id chef.id
    json.chef_full_name chef.full_name
    json.email chef.email
    json.password chef.password
end
