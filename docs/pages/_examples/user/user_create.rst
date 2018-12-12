..  http:example:: curl wget httpie python-requests
    :response: collection_create_response.rst

    POST /v1/users/sign-up HTTP/1.1
    Host: localhost:8080
    Content-Type: application/json

    {
    	"username": "aesel",
      "password": "guest",
      "isAdmin": false
    }
