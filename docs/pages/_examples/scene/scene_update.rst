..  http:example:: curl
    :response: scene_create_response.rst

    POST /v1/scene/key HTTP/1.1
    Host: localhost:5885
    Content-Type: application/json

    {
      "scenes": [
        {
          "name": "testScene",
          "region":"US-MD",
          "latitude":124,
          "longitude":122,
          "assets":["TestAsset10"],
          "tags":["Testing2"]
        }
      ]
    }
