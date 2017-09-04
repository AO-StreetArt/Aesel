Scene Creation/Update
~~~~~~~~~~~~~~~~~~~~~

When a device needs to create or update a new scene without registering
to it, this API is available.

+----------+----------------------------------------+
| Method   | Path                                   |
+----------+----------------------------------------+
| POST     | *<base\_url>*/v1/scene/:region/:name   |
+----------+----------------------------------------+

Post Data
^^^^^^^^^

-  JSON Format
-  Includes lat/long information, tags, and a list of Asset IDs to
   associate to the Scene
-  Example:

{

“latitude”:124.0,

“longitude”:122.0,

“assets”:[“TestAsset10”],

“tags”:[“Testing2”]

}

Sample Request
^^^^^^^^^^^^^^

\`$ curl -H “Content-Type: application/json” -X POST -d ‘DATA\_STRING’
`http://aesel-test/v1/scene/ <http://aesel-test/v1/scene/us-md-mc/wjhs/>`__\ `us-md-mc/wjhs/ <http://aesel-test/v1/scene/us-md-mc/wjhs/>`__\ \`

Sample Response
^^^^^^^^^^^^^^^

{“num\_records”:1,”scenes”:[{“key”:”jklmnop”}]}

Scene Retrieval
~~~~~~~~~~~~~~~

Retrieve scene information. This includes region, name, tags, latitude,
and longitude.

+----------+----------------------------------------+
| Method   | Path                                   |
+----------+----------------------------------------+
| GET      | *<base\_url>*/v1/scene/:region/:name   |
+----------+----------------------------------------+

Sample Request
^^^^^^^^^^^^^^

\`$ curl -X GET
`http://aesel-test/v1/scene/ <http://aesel-test/v1/scenes?latitude=123.01?longitude=125.4?distance=10.0>`__\ `us-md-mc/wjhs <http://aesel-test/v1/scenes?latitude=123.01?longitude=125.4?distance=10.0>`__/\`

Sample Response
^^^^^^^^^^^^^^^

{“num\_records”:1,”scenes”:[

{

“key”:”jklmnop”,

“latitude”:124.0,

“longitude”:122.0,

“asset\_ids”:[“Asset1”],

“tags”:[“Testing2”]

}

]}

Scene Deletion
~~~~~~~~~~~~~~

Delete a scene.

CAUTION: This will delete all information associated to a scene,
including all objects in the scene, and any registrations to devices.
Any object which needs to be retained should be moved to another scene
prior to deletion.

+----------+----------------------------------------+
| Method   | Path                                   |
+----------+----------------------------------------+
| DELETE   | *<base\_url>*/v1/scene/:region/:name   |
+----------+----------------------------------------+

Sample Request
^^^^^^^^^^^^^^

\`$ curl -X DELETE
`http://aesel-test/v1/scene/ <http://aesel-test/v1/scenes?latitude=123.01?longitude=125.4?distance=10.0>`__\ `us-md-mc/wjhs <http://aesel-test/v1/scenes?latitude=123.01?longitude=125.4?distance=10.0>`__/\`

Sample Response
^^^^^^^^^^^^^^^

No JSON Response, only HTTP Success/Error Code

Scene Query
~~~~~~~~~~~

Devices can find scenes by any attribute, including name and distance.
If a distance is not supplied, then the closest scenes matching the
query will be returned.

+----------+-------------------------------+
| Method   | Path                          |
+----------+-------------------------------+
| POST     | *<base\_url>*/v1/scene/data   |
+----------+-------------------------------+

Post Data
^^^^^^^^^

-  JSON Format
-  Allows you to query by name, region, tag, asset ID, or distance from
   a particular lat/long point.
-  The fields ‘latitude’, ‘longitude’, and ‘distance’ should always
   appear together if present. The distance provided is taken in
   kilometers.
-  Example:

{

“name”:”Test Scene 10”,

“latitude”:124.0,

“longitude”:122.0,

“distance”:100.0,

“region”:”TestRegion5”,

“assets”:[“TestAsset10”],

“tags”:[“Testing2”]

}

Sample Request
^^^^^^^^^^^^^^

\`$ curl -H “Content-Type: application/json” -X POST -d ‘DATA\_STRING’
`http://aesel-test/v1/scene/ <http://aesel-test/v1/scene/data/?latitude=123.01&longitude=125.4&distance=10.0>`__\ `data/ <http://aesel-test/v1/scene/data/?latitude=123.01&longitude=125.4&distance=10.0>`__\ \`

Sample Response
^^^^^^^^^^^^^^^

{“num\_records”:1,”scenes”:[

{

“key”:”jklmnop”,

”name”:”TestScene10”,

”region”:”wjhs”,

”latitude”:124.0,

”longitude”:122.0,

“tags”:[“test”,”test2”],

“assets”:[“asset1”,”asset2”]

}

]}
