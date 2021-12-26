json.user @user, :id, :username, :created_at, :updated_at
json.relationships do
    json.items do
        json.array! @user.items, :id, :title, :description
    end
end