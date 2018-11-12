..  http:example:: curl wget httpie python-requests
    :response: project_create_response.rst

    POST /v1/project HTTP/1.1
    Host: localhost:5635
    Content-Type: application/json

    {
    	"name": "Test",
    	"description": "This is a test",
    	"category": "test",
    	"tags": ["testTag"],
    	"sceneGroups": [
    		{
    			"name": "testGroup",
    			"description": "This is a test group",
    			"category": "test",
    			"scenes": ["1234"]
    		}
    	],
    	"assetCollectionIds": ["4321"]
    }
