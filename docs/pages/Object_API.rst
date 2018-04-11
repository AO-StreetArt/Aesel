Object API
==========

An Object is represented by a transformation matrix representing it’s
position in 3-space, as well as a collection of Assets (Mesh files,
Texture files, Shader scripts, etc.). Objects are meant to be interacted
with by individual devices, and these changes will be streamed to either
devices via the forthcoming UDP API. This API exposes CRUD and Query
operations for Objects.

Object Creation/Update
~~~~~~~~~~~~~~~~~~~~~~

.. http:post:: /v1/scene/(scene_name)/object/(object_name)

   Create a new object or update an existing one with name `obj_name` in scene `scene_name`.

   :query int frame:  Optional. The frame to save the object to.  Set to 0 by default.
   :<json string type: The type of the object
   :<json string subtype: The region of the object
   :<json string owner: The owner of current lock on the object
   :<json int timestamp: The timestamp for the update (in milliseconds since the Unix Epoch)
   :<json array(float) translation: The Translation of the object relative to the scene coordinate system
   :<json array(float) rotation\_quaternion: The Quaternion Rotation of the object relative to the scene coordinate system
   :<json array(float) rotation\_euler: The Euler Rotation of the object relative to the scene coordinate system
   :<json array(float) scale: The Scale of the object relative to the scene coordinate system
   :<json array(string) assets: A list of string Asset ID's that should be downloaded on registration
   :>json int num\_records: The number of scenes returned in the response
   :>json array objects: A List of Scene objects which match the query
   :>jsonarr string key: The key of the scene, for use in Object Change Streams
   :reqheader Content-Type: Application/json
   :statuscode 200: Success

.. include:: _examples/object/object_create.rst

Object Retrieval
~~~~~~~~~~~~~~~~

.. http:get:: /v1/scene/(scene_name)/object/(object_name)

   Create a new object or update an existing one with name `obj_name` in scene `scene_name`.

   :query int frame:  Optional. The frame to retrieve for the object.  Set to 0 by default.
   :>json string type: The type of the object
   :>json string subtype: The region of the object
   :>json string owner: The owner of current lock on the object
   :>json int timestamp: The timestamp for the update (in milliseconds since the Unix Epoch)
   :>json array(float) translation: The Translation of the object relative to the scene coordinate system
   :>json array(float) rotation\_quaternion: The Quaternion Rotation of the object relative to the scene coordinate system
   :>json array(float) rotation\_euler: The Euler Rotation of the object relative to the scene coordinate system
   :>json array(float) scale: The Scale of the object relative to the scene coordinate system
   :>json array(string) assets: A list of string Asset ID's that should be downloaded on registration
   :statuscode 200: Success

.. include:: _examples/object/object_get.rst

Object Deletion
~~~~~~~~~~~~~~~

.. http:delete:: /v1/scene/(scene_name)/object/(object_name)

   Delete an object.

   :query int frame:  Optional. The frame to delete for the object.  Set to 0 by default.
   :statuscode 200: Success

.. include:: _examples/object/object_delete.rst

Object Query
~~~~~~~~~~~~

.. http:get:: /v1/scene/(scene_name)/object

   Query for objects in scene `scene_name`.

   :query int frame:  Optional. The frame to retrieve for the object.  Set to 0 by default.
   :query string type: The type of the object
   :query string subtype: The region of the object
   :query string owner: The owner of current lock on the object

.. include:: _examples/object/object_query.rst

Object Lock
~~~~~~~~~~~

.. http:get:: /v1/scene/(scene_name)/object/lock

   A locked object can only be updated by the lock owner, until the lock is released.
   Use this method to obtain the lock on the object

   :query string owner: Required. The ID of the Device requesting the lock.

.. include:: _examples/object/object_lock.rst

Object Unlock
~~~~~~~~~~~~~

.. http:delete:: /v1/scene/(scene_name)/object/lock

   A locked object can only be updated by the lock owner, until the lock is released.
   Use this method to release the lock on the object

   :query string owner: Required. The ID of the Device requesting the lock.

.. include:: _examples/object/object_unlock.rst
