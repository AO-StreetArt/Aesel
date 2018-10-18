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
              "hostname": "localhost",
        			"port":4444,
        			"connection_string": "127.0.0.1:4444",
              "transform":{
                "translation":[0,0,0],
                "rotation":[0,0,0]
              }
            }
          ]
        }
      ]
    }
