# Create admin user
User.create({
    email: Faker::Internet.email,
    f_name: Faker::Name.first_name, 
    l_name: Faker::Name.last_name,
    is_admin: true 
})

# Create 3 users and 3 notifications
3.times do | i |
    User.create({
        email: Faker::Internet.email,
        f_name:  Faker::Name.first_name, 
        l_name:  Faker::Name.last_name,
        is_admin: false 
    })

    Notification.create({
        title: Faker::Book.title,
        body: Faker::Lorem.sentence
    })

    # User-Notification relation per notification
    3.times do | j |
        ClientNotification.create({
            user_id: j, 
            notification_id: i, 
            seen: false
        })
    end
end

# Create a cleint specific notification 
Notification.create({
    title: Faker::Book.title,
    body:Faker::Lorem.sentence
})

ClientNotification.create({
    user_id: 1,
    notification_id: 4,
    seen: false
})