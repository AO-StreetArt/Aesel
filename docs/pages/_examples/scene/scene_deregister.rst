..  http:example:: curl wget httpie python-requests

    POST /v1/scene/jklmnop/deregister HTTP/1.1
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
