..  http:example:: curl
    :response: property_update_response.rst

    POST /v1/scene/jklmnop/property/{key} HTTP/1.1
    Host: localhost:8768
    Content-Type: application/json

    {
      "properties":[
        {
    		  "name":"anotherName",
        	"parent":"anotherParent"
    	  }
      ]
    }
