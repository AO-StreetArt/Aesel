..  http:example:: curl wget httpie python-requests

    POST /v1/object/abcdef HTTP/1.1
    Host: localhost:5885
    Content-Type: application/json

    {
    "scene": "123",
    "translation": [0, 0, 1],
    "quaternion_rotation": [0, 1, 0, 0],
    "euler_rotation": [0, 0, 0],
    "scale": [1, 1, 2]
    }
