..  http:example:: curl
    :response: property_query_response.rst

    POST /v1/scene/jklmnop/property/query HTTP/1.1
    Host: localhost:5885
    Content-Type: application/json

    {
      "properties":[
        {
          "name":"test"
        }
      ]
    }
