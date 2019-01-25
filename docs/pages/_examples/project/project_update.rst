..  http:example:: curl
    :response: project_create_response.rst

    POST /v1/project/{key} HTTP/1.1
    Host: localhost:8080
    Content-Type: application/json

    {
        "name": "AnotherName",
        "description": "This is a second test",
        "category": "testing"
    }
