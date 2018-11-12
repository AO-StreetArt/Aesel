..  http:example:: curl wget httpie python-requests
    :response: project_create_response.rst

    POST /v1/project/{key} HTTP/1.1
    Host: localhost:5635
    Content-Type: application/json

    {
        "name": "AnotherName",
        "description": "This is a second test",
        "category": "testing",
        "tags": [
            "testTag2"
        ],
        "sceneGroups": [
            {
                "name": "testGroup2",
                "description": "This is another test group",
                "category": "testing",
                "scenes": [
                    "12345"
                ]
            }
        ],
        "assetCollectionIds": [
            "43212"
        ]
    }
