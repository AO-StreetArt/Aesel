..  http:example:: curl
    :response: collection_create_response.rst

    POST /v1/collection/{key} HTTP/1.1
    Host: localhost:8080
    Content-Type: application/json

    {
    	"name":"testCollection",
    	"description": "This is a test",
    	"category": "test",
    	"tags": ["test1"]
    }
