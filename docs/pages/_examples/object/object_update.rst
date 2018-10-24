..  http:example:: curl
    :response: object_update_response.rst

    POST /v1/scene/scene-key/object/key HTTP/1.1
    Host: localhost:8080
    Content-Type: application/json

    {
    "name": "Test Object 123464",
    "type": "Curve",
    "subtype": "Sphere",
    "owner": "456",
    "timestamp": 123456789,
    "translation": [0, 0, 1],
    "quaternion_rotation": [0, 1, 0, 0],
    "euler_rotation": [0, 0, 0],
    "scale": [1, 1, 2],
    "assets": ["Asset_5"]
    }
