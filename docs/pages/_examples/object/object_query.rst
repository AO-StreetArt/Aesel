..  http:example:: curl wget httpie python-requests
    :response: object_query_response.rst

    GET /v1/scene/name/object?type=mesh HTTP/1.1
    Host: localhost:5885
    Content-Type: application/json

    {
      "translation":[0, 0, 0],
      "rotation":[0, 0, 0]
    }
