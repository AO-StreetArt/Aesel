..  http:example:: curl

    PUT /users/{key} HTTP/1.1
    Host: localhost:8080
    Content-Type: application/json

    {
    	"username": "guest2",
      "password": "guest2",
      "email": "test2@test.com"
      "isAdmin": false,
      "isActive": true,
      "favoriteProjects": [],
      "favoriteScenes": []
    }
