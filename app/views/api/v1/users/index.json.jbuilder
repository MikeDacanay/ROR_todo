json.data do
    json.users do
        json.array! @users, :id, :username, :created_at, :updated_at
    end
end