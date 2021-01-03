users = Array.new
notifications = Array.new

# Create 3 users and 3 notifications
3.times do | i |
    users << User.create({
        email: Faker::Internet.email,
        f_name: Faker::Name.first_name, 
        l_name: Faker::Name.last_name,
        is_admin: false 
    })

    notifications << Notification.create({
        title: Faker::Book.title,
        body: Faker::Lorem.sentence
    })
end

# User-Notification relation per notification
users.each do | user |
    notifications.each do | notification |
        ClientNotification.create({
            user: user, 
            notification: notification, 
            seen: false
        })
    end
end

# Create a cleint specific notification 
notifications << Notification.create({
    title: Faker::Book.title,
    body:Faker::Lorem.sentence
})

ClientNotification.create({
    user: users.first, 
    notification: notifications.last, 
    seen: false
})

# Create admin user
User.create({
    email: Faker::Internet.email,
    f_name: Faker::Name.first_name, 
    l_name: Faker::Name.last_name,
    is_admin: true 
})