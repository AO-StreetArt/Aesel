HTTP/1.1 200 OK
Location: http://localhost:5885/v1/scene/query
Content-Type: application/json

{
"num_records":1,
  "scenes":[
    {
    "key":"jklmnop",
    "name":"TestScene10",
    "region":"US-MD",
    "latitude":124.0,
    "longitude":122.0,
    "tags":["test","test2"],
    "asset_ids":["asset1","asset2"]
    }
  ]
}
