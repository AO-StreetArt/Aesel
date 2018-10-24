..  http:example:: curl
    :response: property_create_response.rst

    POST /v1/scene/jklmnop/property HTTP/1.1
    Host: localhost:8768
    Content-Type: application/json

    {
      "properties":[
        {
        	"key":"12345",
        	"name":"testName",
        	"parent":"testParent",
        	"asset_sub_id":"testAssetSubId",
        	"scene":"testScene",
        	"frame":1,
        	"timestamp":123456789,
        	"values":[
        		{
        			"value":100,
        			"left_type":"vector",
        			"left_x":10,
        			"left_y":5,
        			"right_type":"free",
        			"right_x":4,
        			"right_y":3

        		}
        	]
        }
      ]
    }
