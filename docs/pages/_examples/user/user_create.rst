..  http:example:: curl

    POST /users/sign-up HTTP/1.1
    Host: localhost:8080
    Content-Type: application/json

    {
    	"username": "aesel",
      "password": "guest",
      "email": "test@test.com",
      "isAdmin": false,
      "isActive": true,
      "favoriteProjects": [],
      "favoriteScenes": []
    }
