Object API
==========

An Object is represented by a transformation matrix representing it’s
position in 3-space, as well as a collection of Assets (Mesh files,
Texture files, Shader scripts, etc.). Objects are meant to be interacted
with by individual devices, and these changes will be streamed to either
devices via the forthcoming UDP API. This API exposes CRUD and Query
operations for Objects.

Objects may also have a frame/timestamp, as well as animation graph handles.  Both of
these are, however, optional.

Object Creation
~~~~~~~~~~~~~~~

.. http:post:: /v1/scene/(scene_key)/object/

   Create a new object with key `obj_key` in scene `scene_key`.  The generated key of
   the object will be returned in the response.

   :reqheader Content-Type: Application/json
   :statuscode 200: Success

.. include:: _examples/object/object_create.rst

Object Update
~~~~~~~~~~~~~

.. http:post:: /v1/scene/(scene_key)/object/(object_key)

   Update an existing object with name `obj_name` in scene `scene_name`.

   :reqheader Content-Type: Application/json
   :statuscode 200: Success

.. include:: _examples/object/object_update.rst

Object Retrieval
~~~~~~~~~~~~~~~~

.. http:get:: /v1/scene/(scene_key)/object/(object_key)

   Get an object with key `obj_key` in scene `scene_key`.

   :statuscode 200: Success

.. include:: _examples/object/object_get.rst

Object Deletion
~~~~~~~~~~~~~~~

.. http:delete:: /v1/scene/(scene_key)/object/(object_key)

   Delete an object.

   :statuscode 200: Success

.. include:: _examples/object/object_delete.rst

Object Query
~~~~~~~~~~~~

.. http:post:: /v1/scene/(scene_key)/object/query

   Query for objects in scene `scene_key`.

.. include:: _examples/object/object_query.rst

Object Lock
~~~~~~~~~~~

.. http:get:: /v1/scene/(scene_key)/object/(object_key)/lock

   A lock allows a single client to obtain 'ownership' of an object.  This is
   an atomic operation, and is guaranteed to return a lock to one and only one
   client who requests it.  Keep in mind, however, that no checks are performed
   within CLyman to verify that the object's owner is the only one updating it,
   it is the responsibility of the client to obtain a lock prior to making updates.

   :statuscode 200: Success
   :statuscode 423: Object Lock Failed
   :query string device: Required. The ID of the Device requesting the lock.

.. include:: _examples/object/object_lock.rst

Object Unlock
~~~~~~~~~~~~~

.. http:delete:: /v1/scene/(scene_key)/object/(object_key)/lock

   Unlocking allows a client to release 'ownership' of an object.  This is
   an atomic operation, and no additional locks will be granted on a locked
   object until this method is called by the owner.

   :statuscode 200: Success
   :query string device: Required. The ID of the Device requesting the lock.

.. include:: _examples/object/object_unlock.rst
