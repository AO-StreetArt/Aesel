Asset Creation/Update
~~~~~~~~~~~~~~~~~~~~~

When a device needs to create or update an asset, the Creation/Update
API is available. When calling the API to create a new Asset, either an
Object ID or Scene ID must be specified.

+----------+--------------------------------+
| Method   | Path                           |
+----------+--------------------------------+
| POST     | *<base\_url>*/v1/asset/:key/   |
+----------+--------------------------------+

Post Data
^^^^^^^^^

-  Asset File to be stored

Sample Request
^^^^^^^^^^^^^^

\`$ curl -H “Content-Type: application/json” -X POST -d @filename
`http://aesel-test/v1/ <http://aesel-test/v1/asset/123/?object_id=abcdef>`__\ `asset/123 <http://aesel-test/v1/asset/123/?object_id=abcdef>`__\ \`

Sample Response
^^^^^^^^^^^^^^^

No JSON Response, only HTTP Success/Error Code

Asset Retrieve
~~~~~~~~~~~~~~

The retrieval API allows a device to retrieve one asset.

+----------+--------------------------------+
| Method   | Path                           |
+----------+--------------------------------+
| GET      | *<base\_url>*/v1/asset/:key/   |
+----------+--------------------------------+

Sample Request
^^^^^^^^^^^^^^

\`$ curl -X GET
`http://aesel-test/v1/ <http://aesel-test/v1/asset/123>`__\ `asset/123 <http://aesel-test/v1/asset/123>`__\ \`

Sample Response
^^^^^^^^^^^^^^^

No JSON Response, the response data will instead contain the requested
file (\*.obj, \*.glsl, etc)

Asset Delete
~~~~~~~~~~~~

The delete API allows a device to remove one or more object assets.

+----------+--------------------------------+
| Method   | Path                           |
+----------+--------------------------------+
| DELETE   | *<base\_url>*/v1/asset/:key/   |
+----------+--------------------------------+

Sample Request
^^^^^^^^^^^^^^

\`$ curl -X DELETE
`http://aesel-test/v1/ <http://aesel-test/v1/asset/123>`__\ `asset/123 <http://aesel-test/v1/asset/123>`__\ \`

Sample Response
^^^^^^^^^^^^^^^

No JSON Response, only HTTP Success/Error Code
