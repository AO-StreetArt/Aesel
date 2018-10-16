HTTP/1.1 200 OK
Location: http://localhost:5885/v1/scene/jklmnop/register
Content-Type: application/json

{
    "msg_type": 4,
    "err_code": 100,
    "num_records": 2,
    "scenes": [
        {
            "key": "20dd78a2-9224-11e8-b492-d850e6db3ad1",
            "active": true,
            "distance": 0,
            "assets": [],
            "tags": [],
            "devices": [
                {
                    "key": "12345",
                    "transform": {
                        "translation": [
                            0,
                            0,
                            0
                        ],
                        "rotation": [
                            0,
                            0,
                            0
                        ]
                    }
                }
            ]
        },
        {
            "key": "123456",
            "active": true,
            "distance": 0,
            "assets": [],
            "tags": [],
            "devices": []
        }
    ]
}
