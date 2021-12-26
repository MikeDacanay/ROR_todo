users = User.create([
    {
        username: 'Mike',
        password: 'pass1'
    },
    {
        username: 'Jade',
        password: 'pass2'
    },
    {
        username: 'Mark',
        password: 'pass3'
    }
])

items = Item.create([
    {
        title: 'Get haircut',
        description: 'Go to Johnny to get haircut',        
        user_id: 6
    },
    {
        title: 'Get sushi with Jade',
        description: 'Make sure to get there before 6:00PM',        
        user_id: 6        
    }
]);