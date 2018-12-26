..  http:example:: curl

    POST /v1/project/{key}/groups/{groupName} HTTP/1.1
    Host: localhost:5635
    Content-Type: application/json

    {
        "name": "AnotherName",
        "description": "This is a second test",
        "category": "testing"
    }
