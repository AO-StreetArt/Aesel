..  http:example:: curl wget httpie python-requests
    :response: scene_register_response.rst

    PUT /v1/scene/name/registration?device_id=ABC&device_host=localhost&device_port=5678 HTTP/1.1
    Host: localhost:5885
    Content-Type: application/json

    {
      "translation":[0, 0, 0],
      "rotation":[0, 0, 0]
    }
