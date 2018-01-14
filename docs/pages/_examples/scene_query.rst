**Request**

\`$ curl -H “Content-Type: application/json” -X POST -d ‘DATA\_STRING’ http://aesel-test/v1/scene/data/?latitude=123.01&longitude=125.4&distance=10.0\`

**Response**

{“num\_records”:1,”scenes”:[

{

“key”:”jklmnop”,

”name”:”TestScene10”,

”region”:”US-MD”,

”latitude”:124.0,

”longitude”:122.0,

“tags”:[“test”,”test2”],

“assets”:[“asset1”,”asset2”]

}

]}
