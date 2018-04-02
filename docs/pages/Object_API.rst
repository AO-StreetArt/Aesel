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

"name": "Test Object 123464",

"type": "Curve",

"subtype": "Sphere",

"owner": "456",

"timestamp": 123456789,

"translation": [0, 0, 1],

"quaternion\_rotation": [0, 1, 0, 0],

"euler\_rotation": [0, 0, 0],

"scale": [1, 1, 2],

"assets": ["Asset\_5"]

}

.. include:: _examples/object_create.rst

Parameters
^^^^^^^^^^

-  frame (integer) – Optional. The object frame to retrieve.  0 By default.

Object Retrieval
~~~~~~~~~~~~~~~~

When a device needs to get the details of an object, the Retrieval API
is available.

+----------+-----------------------------------------------------+
| Method   | Path                                                |
+----------+-----------------------------------------------------+
| GET      | *<base\_url>*/v1/scene/:scene_name/object/:obj_name |
+----------+-----------------------------------------------------+

.. include:: _examples/object_get.rst

Parameters
^^^^^^^^^^

-  frame (integer) – Optional. The object frame to retrieve.  0 By default.

Object Deletion
~~~~~~~~~~~~~~~

When a device needs to remove an object, the Deletion API is available.

+----------+-----------------------------------------------------+
| Method   | Path                                                |
+----------+-----------------------------------------------------+
| DELETE   | *<base\_url>*/v1/scene/:scene_name/object/:obj_name |
+----------+-----------------------------------------------------+

.. include:: _examples/object_delete.rst

Parameters
^^^^^^^^^^

-  frame (integer) – Optional. The object frame to retrieve, by default deletes all frames.

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

-  type (string) – Optional. The type of object to retrieve
-  subtype (string) – Optional. The subtype of object to retrieve
-  owner (string) – Optional. Return objects owned by a particular
   device
-  frame (integer) – Optional. The object frame to retrieve.  0 By default.

.. include:: _examples/object_query.rst

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

.. include:: _examples/object_lock.rst

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

.. include:: _examples/object_unlock.rst
