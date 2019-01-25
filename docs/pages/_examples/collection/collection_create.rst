..  http:example:: curl
    :response: collection_create_response.rst

    POST /v1/collection HTTP/1.1
    Host: localhost:8080
    Content-Type: application/json

    {
    	"name":"testCollection",
    	"description": "This is a test",
    	"category": "test",
      "public": true,
    	"tags": ["test1"],
      "isPublic": true
    }
