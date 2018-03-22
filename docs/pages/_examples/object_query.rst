**Request**

\`$ curl -X GET
 http://localhost:5885/v1/scene/us-md-mc/wjhs/object/?type=Mesh&subtype=Cube\`

**Response**

{"msg\_type":4, "err\_code":100, "num\_records":2, "objects":[

{

"name":"Test Object 123465",

"region":"US-MD",

"scene":"DEFGHIJ123465",

"type":"Mesh",

"subtype":"Cube",

"owner":"456",

"transform":[1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0],

"assets": ["Asset\_5"]

}, {

"name":"Test Object 123456",

"region":"US-MD",

"scene":"DEFGHIJ123456",

"type":"Curve",

"subtype":"Sphere",

"owner":"456",

"transform":[1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0],

"assets": ["Asset\_5"]

}

]}
