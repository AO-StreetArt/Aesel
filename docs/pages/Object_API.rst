Object API
----------

An Object is represented by a transformation matrix representing it’s
position in 3-space, as well as a collection of Assets (Mesh files,
Texture files, Shader scripts, etc.). Objects are meant to be interacted
with by individual devices, and these changes will be streamed to either
devices via the forthcoming UDP API.

Objects are stored under the region, and then by key.

Object Creation/Update
~~~~~~~~~~~~~~~~~~~~~~

When a device needs to create or update an object, the Creation/Update
API is available.

+----------+----------------------------------------------------+
| Method   | Path                                               |
+----------+----------------------------------------------------+
| POST     | *<base\_url>*/v1/scene/:region/:name/object/:key   |
+----------+----------------------------------------------------+

Post Data
^^^^^^^^^

-  JSON Format
-  Includes both a transformation matrix and a list of assets registered
   to the object,
-  Example:

{

“name”: “Test Object 123464”,

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
`http://aesel-test/v1/scene/ <http://aesel-test/v1/scene/us-md-mc/wjhs/object/123/>`__\ `us-md-mc/wjhs/object/123/ <http://aesel-test/v1/scene/us-md-mc/wjhs/object/123/>`__\ \`

Sample Response
^^^^^^^^^^^^^^^

{“num\_records”:1, “objects”:[{“key”:”5951dd759af59c00015b140b”}]}

Object Retrieval
~~~~~~~~~~~~~~~~

When a device needs to get the details of an object, the Retrieval API
is available.

+----------+----------------------------------------------------+
| Method   | Path                                               |
+----------+----------------------------------------------------+
| GET      | *<base\_url>*/v1/scene/:region/:name/object/:key   |
+----------+----------------------------------------------------+

Sample Request
^^^^^^^^^^^^^^

\`$ curl -X GET
`http://aesel-test/v1/scene/ <http://aesel-test/v1/scene/us-md-mc/wjhs/object/123/>`__\ `us-md-mc/wjhs/object/123/ <http://aesel-test/v1/scene/us-md-mc/wjhs/object/123/>`__\ \`

Sample Response
^^^^^^^^^^^^^^^

{“num\_records”:1, “objects”:[

{

“key”:”5951dd759af59c00015b1409”,

“name”:”Test Object 123463”,

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

+----------+----------------------------------------------------+
| Method   | Path                                               |
+----------+----------------------------------------------------+
| DELETE   | *<base\_url>*/v1/scene/:region/:name/object/:key   |
+----------+----------------------------------------------------+

Sample Request
^^^^^^^^^^^^^^

\`$ curl -X DELETE
`http://aesel-test/v1/scene/ <http://aesel-test/v1/scene/us-md-mc/wjhs/object/123/>`__\ `us-md-mc/wjhs/object/123/ <http://aesel-test/v1/scene/us-md-mc/wjhs/object/123/>`__\ \`

Sample Response
^^^^^^^^^^^^^^^

No JSON Response, only HTTP Success/Error Code

Object Query
~~~~~~~~~~~~

When a device needs to get the details of an object, but does not have
the object key available, the Query API is available.

+----------+------------------------------------------------+
| Method   | Path                                           |
+----------+------------------------------------------------+
| GET      | *<base\_url>*/v1/scene/:region/:name/object/   |
+----------+------------------------------------------------+

Parameters
^^^^^^^^^^

-  name (string) – Optional. The name of the object to query for
-  type (string) – Optional. The type of object to retrieve
-  subtype (string) – Optional. The subtype of object to retrieve
-  owner (string) – Optional. Return objects owned by a particular
   device

Sample Request
^^^^^^^^^^^^^^

\`$ curl -X GET
`http://aesel-test/v1/scene/ <http://aesel-test/v1/scene/us-md-mc/wjhs/object/?type=Mesh&subtype=Cube>`__\ `us-md-mc/wjhs/object/?type=Mesh&subtype=Cube <http://aesel-test/v1/scene/us-md-mc/wjhs/object/?type=Mesh&subtype=Cube>`__\ \`

Sample Response
^^^^^^^^^^^^^^^

{“msg\_type”:4, “err\_code”:100, “num\_records”:2, “objects”:[

{

“name”:”Test Object 123465”,

“scene”:”DEFGHIJ123465”,

“type”:”Mesh”,

“subtype”:”Cube”,

“owner”:”456”,

“transform”:[1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0],

“assets”: [“Asset\_5”]

}, {

“name”:”Test Object 123456”,

“scene”:”DEFGHIJ123456”,

“type”:”Curve”,

“subtype”:”Sphere”,

“owner”:”456”,

“transform”:[1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0,0.0,0.0,0.0,0.0,1.0],

“assets”: [“Asset\_5”]

}

]}


