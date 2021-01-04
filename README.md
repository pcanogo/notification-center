# Notification Center

Service app that allows admins to generate notifications for users and check what is the read status per user on the notification. Users can use consume the endpoints to get list of notification, view specific notification and update the read status of each notification. 

## Tech
 - Ruby on Rails 5
 - Posgresql 12
## Database Models

**User:** id, email, f_name, l_name, is_admin, created_at, updated_at

**Notification:** id, title, body, created_at, updated_at

**ClientNotification:** id, *FK:* user_id, *FK:* notification_id, seen, created_at, updated_at


## Admin Routes 
#### GET: api/v1/admin/notifications
returns list of all notifications. 
```JSON
    [
        {   
        "id": 1,
        "title": "Title",
        "body": "Body",
        "created_at": "2021-01-04T11:58:43.052Z",
        "updated_at": "2021-01-04T11:58:43.052Z"
        }, 
    ]
 ```

#### GET: api/v1/admin/notifications/:id
returns list of read status of notification per user type client
```JSON
[
	{
		"user_id": 1,
		"seen": true
	}...
]
```

#### POST: api/v1/admin/notifications
creates a notification for all users type client in records
**params:** title:string, body:string 

#### POST: api/v1/admin/notifications/clients
creates a notification for a specific list of users type client
**params:** title: *string* , body: *string*, clients:* list of ids*

## User Routes
### GET: api/v1/users/:user_id/notifications
Get all notifications of user.
```json
[
    {
        "id": 1,
        "seen": true,
        "title": "title",
        "body": "body",
        "date": "2021-01-04T11:58:43.052Z"
    },
]
```
### GET: api/v1/users/:user_id/notifications/:id
Get specific notification of user.
```json
[
    {
        "id": 1,
        "seen": true,
        "title": "title",
        "body": "body",
        "date": "2021-01-04T11:58:43.052Z"
    },
]
```
### PUT: api/v1/users/:user_id/notifications/:id
update read status of notification
**params:** seen: *boolean*

## TODO
- tests, tests, tests...
- CI/CD
- Authenticate User
- Protect routes upon session and ownership
- Place controller logic in service files and inject dependencies
- replace hardcoded credentials with ENV variables
- Swagger API documentation