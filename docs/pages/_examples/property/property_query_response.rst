HTTP/1.1 200 OK
Location: http://localhost:5885/v1/scene/jklmnop/property/query
Content-Type: application/json

{
    "msg_type": 10,
    "err_code": 100,
    "num_records": 1,
    "properties": [
        {
            "name": "testName",
            "parent": "testParent",
            "asset_sub_id": "testAssetSubId",
            "scene": "jklmnop",
            "frame": 1,
            "timestamp": 123456789,
            "values": [
                {
                    "value": 100,
                    "left_type": "vector",
                    "left_x": 10,
                    "left_y": 5,
                    "right_type": "free",
                    "right_x": 4,
                    "right_y": 3
                }
            ]
        }
    ]
}
