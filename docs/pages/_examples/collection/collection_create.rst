..  http:example:: curl wget httpie python-requests
    :response: collection_create_response.rst

    POST /v1/collection HTTP/1.1
    Host: localhost:5635
    Content-Type: application/json

    {
    	"name":"testCollection",
    	"description": "This is a test",
    	"category": "test",
    	"tags": ["test1"]
    }
