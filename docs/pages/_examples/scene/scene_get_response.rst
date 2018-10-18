HTTP/1.1 200 OK
Location: http://localhost:5885/v1/scene
Content-Type: application/json

{
    "msg_type": 2,
    "err_code": 100,
    "num_records": 1,
    "start_record": 0,
    "scenes": [
        {
            "key": "123",
            "name": "testScene",
            "region": "us-ga",
            "latitude": 100,
            "active": true,
            "longitude": 100,
            "distance": 0,
            "assets": [
                "asset1"
            ],
            "tags": [
                "tag1"
            ],
            "devices": []
        }
    ]
}
