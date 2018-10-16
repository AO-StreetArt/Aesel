..  http:example:: curl wget httpie python-requests
    :response: scene_query_response.rst

    POST /v1/scene/query HTTP/1.1
    Host: localhost:5885
    Content-Type: application/json

    {
      "scenes":[
        {
          "name":"test",
          "region":"US-MD",
          "latitude":124,
          "longitude":122,
          "assets":["TestAsset10"],
          "tags":["Testing2"]
        }
      ]
    }
