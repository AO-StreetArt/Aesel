..  http:example:: curl
    :response: asset_relationship_save_response.rst

    PUT /v1/relationship HTTP/1.1
    Host: localhost:8080
    Content-Type: application/json

    {
      "assetId": "asset123",
      "assetSubId": "meshName",
      "relationshipType": "scene",
      "relationshipSubtype": "mesh",
      "relatedId": "scene123"
    }
