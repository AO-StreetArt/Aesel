..  http:example:: curl wget httpie python-requests
    :response: scene_update_response.rst

    PUT /v1/scene/key HTTP/1.1
    Host: localhost:8080
    Content-Type: application/json

    {
      "name": "test"
      "region":"US-MD",
      "latitude":124,
      "longitude":122,
      "assets":["TestAsset10"],
      "tags":["Testing2"]
    }
