..  http:example:: curl wget httpie python-requests
    :response: scene_create_response.rst

    POST /v1/scene/name HTTP/1.1
    Host: localhost:5885
    Content-Type: application/json

    {
      "region":"US-MD",
      "latitude":"124.0",
      "longitude":"122.0",
      "assets":["TestAsset10"],
      "tags":["Testing2"]
    }
