..  http:example:: curl

    POST /v1/project/{key}/groups HTTP/1.1
    Host: localhost:8080
    Content-Type: application/json

    {
        "name": "AnotherName",
        "description": "This is a second test",
        "category": "testing"
    }
