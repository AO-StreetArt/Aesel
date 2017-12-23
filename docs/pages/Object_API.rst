Object Creation/Update
~~~~~~~~~~~~~~~~~~~~~~

When a device needs to create or update an object, the Creation/Update
API is available.

+----------+-----------------------------------------------------+
| Method   | Path                                                |
+----------+-----------------------------------------------------+
| POST     | *<base\_url>*/v1/scene/:scene_name/object/:obj_name |
+----------+-----------------------------------------------------+

Post Data
^^^^^^^^^

-  JSON Format
-  Includes both a transformation matrix and a list of assets registered
   to the object,
-  Example:

{

“name”: “Test Object 123464”,

"region": "US-MD",

“type”: “Curve”,

“subtype”: “Sphere”,

“owner”: “456”,

“translation”: [0, 0, 1],

“rotation\_euler”: [0, 1, 0, 0],

“scale”: [1, 1, 2],

“assets”: [“Asset\_5”]

}

Sample Request
^^^^^^^^^^^^^^

\`$ curl -H “Content-Type: application/json” -X POST -d ‘DATA\_STRING’
 http://aesel-test/v1/scene/wjhs/object/123/\`

Sample Response
^^^^^^^^^^^^^^^

{“num\_records”:1, “objects”:[{“key”:”5951dd759af59c00015b140b”}]}

Object Retrieval
~~~~~~~~~~~~~~~~

When a device needs to get the details of an object, the Retrieval API
is available.

+----------+-----------------------------------------------------+
| Method   | Path                                                |
+----------+-----------------------------------------------------+
| GET      | *<base\_url>*/v1/scene/:scene_name/object/:obj_name |
+----------+-----------------------------------------------------+

Sample Request
^^^^^^^^^^^^^^

\`$ curl -X GET http://aesel-test/v1/scene/wjhs/object/123/\`

Sample Response
^^^^^^^^^^^^^^^

{“num\_records”:1, “objects”:[

{

“key”:”5951dd759af59c00015b1409”,

“name”:”123”,

"region":"US-MD",

“scene”:”DEFGHIJ123463”,

“type”:”Mesh”,

“subtype”:”Cube”,

“owner”:”456”,

“transform”:[1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0],

“assets”: [“Asset\_5”]

}

]}

Object Deletion
~~~~~~~~~~~~~~~

When a device needs to remove an object, the Deletion API is available.

+----------+-----------------------------------------------------+
| Method   | Path                                                |
+----------+-----------------------------------------------------+
| DELETE   | *<base\_url>*/v1/scene/:scene_name/object/:obj_name |
+----------+-----------------------------------------------------+

Sample Request
^^^^^^^^^^^^^^

\`$ curl -X DELETE http://aesel-test/v1/scene/wjhs/object/123/\'

Sample Response
^^^^^^^^^^^^^^^

No JSON Response, only HTTP Success/Error Code

Object Query
~~~~~~~~~~~~

When a device needs to get the details of an object, but does not have
the object name available, the Query API is available.

+----------+------------------------------------------------+
| Method   | Path                                           |
+----------+------------------------------------------------+
| GET      | *<base\_url>*/v1/scene/:scene_name/object/     |
+----------+------------------------------------------------+

Parameters
^^^^^^^^^^

-  scene (string) - Optional. The scene of the object to query for
-  type (string) – Optional. The type of object to retrieve
-  subtype (string) – Optional. The subtype of object to retrieve
-  owner (string) – Optional. Return objects owned by a particular
   device

Sample Request
^^^^^^^^^^^^^^

\`$ curl -X GET
 http://aesel-test/v1/scene/us-md-mc/wjhs/object/?type=Mesh&subtype=Cube\`

Sample Response
^^^^^^^^^^^^^^^

{“msg\_type”:4, “err\_code”:100, “num\_records”:2, “objects”:[

{

“name”:”Test Object 123465”,

"region":"US-MD",

“scene”:”DEFGHIJ123465”,

“type”:”Mesh”,

“subtype”:”Cube”,

“owner”:”456”,

“transform”:[1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0],

“assets”: [“Asset\_5”]

}, {

“name”:”Test Object 123456”,

"region":"US-MD",

“scene”:”DEFGHIJ123456”,

“type”:”Curve”,

“subtype”:”Sphere”,

“owner”:”456”,

“transform”:[1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0],

“assets”: [“Asset\_5”]

}

]}

Object Lock
~~~~~~~~~~~

A locked object can only be updated by the lock owner, until the lock is released.
Use this method to obtain the lock on the object

+----------+----------------------------------------------------------+
| Method   | Path                                                     |
+----------+----------------------------------------------------------+
| GET      | *<base\_url>*/v1/scene/:scene_name/object/:obj_name/lock |
+----------+----------------------------------------------------------+

Parameters
^^^^^^^^^^

-  owner (string) - Required. The ID of the Device requesting the lock

Sample Request
^^^^^^^^^^^^^^

\`$ curl -X GET http://aesel-test/v1/scene/wjhs/object/123/lock?owner=abc\'

Sample Response
^^^^^^^^^^^^^^^

No JSON Response, only HTTP Success/Error Code

Object Unlock
~~~~~~~~~~~~~

A locked object can only be updated by the lock owner, until the lock is released.
Use this method to release the lock on the object

+----------+----------------------------------------------------------+
| Method   | Path                                                     |
+----------+----------------------------------------------------------+
| DELETE   | *<base\_url>*/v1/scene/:scene_name/object/:obj_name/lock |
+----------+----------------------------------------------------------+

Parameters
^^^^^^^^^^

-  owner (string) - Required. The ID of the Device requesting the lock

Sample Request
^^^^^^^^^^^^^^

\`$ curl -X DELETE http://aesel-test/v1/scene/wjhs/object/123/lock?owner=abc\'

Sample Response
^^^^^^^^^^^^^^^

No JSON Response, only HTTP Success/Error Code
