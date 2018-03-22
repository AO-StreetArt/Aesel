**Request**

\`$ curl -H "Content-Type: application/json" -X POST -d ‘DATA\_STRING’ http://localhost:5885/v1/object/abc123/\`

**Response**

No JSON Response, only HTTP Success/Error Code.

The HTTP response code only acknowledges receipt of the update.  Confirmation of
update success is received asynchronously via UDP streams.  Because of the nature
of UDP, it is possible that this message will be lost and no confirmation of update
success will be received.
