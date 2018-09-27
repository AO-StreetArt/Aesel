..  http:example:: curl wget httpie python-requests
    :response: object_create_response.rst

    POST /v1/scene/key/object HTTP/1.1
    Host: localhost:8080
    Content-Type: application/json

    {
      "msg_type": 0,
      "objects":[
        {
                "name": "Test Object 123464",
                "type": "Curve",
                "subtype": "Sphere",
                "owner": "",
                "frame": 0,
                "timestamp": 123456789,
                "translation": [0, 0, 1],
                "quaternion_rotation": [0, 1, 0, 0],
                "euler_rotation": [0, 0, 0],
                "scale": [1, 1, 2],
                "assets": ["Asset_5"],
                "translation_handle":[
                        {"left_type":"test","left_x":0,"left_y":0,"right_type":"","right_x":0,"right_y":0},
                        {"left_type":"","left_x":0,"left_y":0,"right_type":"","right_x":0,"right_y":0},
                        {"left_type":"","left_x":0,"left_y":0,"right_type":"","right_x":0,"right_y":0}],
                "rotation_handle":[
                        {"left_type":"test","left_x":0,"left_y":0,"right_type":"","right_x":0,"right_y":0},
                        {"left_type":"","left_x":0,"left_y":0,"right_type":"","right_x":0,"right_y":0},
                        {"left_type":"","left_x":0,"left_y":0,"right_type":"","right_x":0,"right_y":0},
                        {"left_type":"","left_x":0,"left_y":0,"right_type":"","right_x":0,"right_y":0}],
                "scale_handle":[
                        {"left_type":"test","left_x":0,"left_y":0,"right_type":"","right_x":0,"right_y":0},
                        {"left_type":"","left_x":0,"left_y":0,"right_type":"","right_x":0,"right_y":0},
                        {"left_type":"","left_x":0,"left_y":0,"right_type":"","right_x":0,"right_y":0}]
          }
      ]
    }
