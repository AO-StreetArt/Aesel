..  http:example:: curl wget httpie python-requests
    :response: scene_register_response.rst

    POST /v1/scene/jklmnop/register HTTP/1.1
    Host: localhost:5885
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
