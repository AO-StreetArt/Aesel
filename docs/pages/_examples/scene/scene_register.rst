..  http:example:: curl wget httpie python-requests
    :response: scene_register_response.rst

    POST /v1/register HTTP/1.1
    Host: localhost:8080
    Content-Type: application/json

    {
      "scenes":[
        {
          "key":"jklmnop",
          "devices":[
            {
              "key":"Ud132"
            }
          ]
        }
      ]
    }
