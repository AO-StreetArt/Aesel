..  http:example:: curl wget httpie python-requests

    POST /v1/align HTTP/1.1
    Host: localhost:8080
    Content-Type: application/json

    {
      "scenes":[
        {
          "key":"jklmnop",
          "devices":[
            {
              "key":"Ud132",
              "transform":{
                "translation":[0,0,0],
                "rotation":[0,0,0]
              }
            }
          ]
        }
      ]
    }
