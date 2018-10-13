..  http:example:: curl wget httpie python-requests

    POST /v1/scene/name/registration?device_id=ABC HTTP/1.1
    Host: localhost:8080
    Content-Type: application/json

    {
      "translation":[0, 0, 0],
      "rotation":[0, 0, 0]
    }
