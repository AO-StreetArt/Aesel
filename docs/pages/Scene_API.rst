Scene API
=========

A Scene is a group of Objects associated to a particular Latitude and
Longitude. Examples of Scenes include levels in a video game, rooms in a house,
and shots in a movie.  This API exposes CRUD and Query operations for Scenes.

When authentication is active, scenes are associated to the user that
creates them and can be public or private.  Users can only interact with
scenes that are either public, or that they own.

Scene Creation
~~~~~~~~~~~~~~

.. http:put:: /v1/scene/(key)

   Create a new scene with key `key`.

   :reqheader Content-Type: Application/json
   :statuscode 200: Success

.. include:: _examples/scene/scene_create_key.rst

Scene Update
~~~~~~~~~~~~

.. http:post:: /v1/scene/(key)

   Update an existing scene with key `key`.  This executes a full overwrite
   of any fields present in the message, and triggers Object Change Streams.

   :reqheader Content-Type: Application/json
   :statuscode 200: Success

.. include:: _examples/scene/scene_update.rst

Scene Retrieval
~~~~~~~~~~~~~~~

.. http:get:: /v1/scene/(key)

   Retrieve scene information for scene `key`. This includes name, region, tags, latitude, and longitude.

   :statuscode 200: Success

.. include:: _examples/scene/scene_get.rst

Scene Deletion
~~~~~~~~~~~~~~

.. http:delete:: /v1/scene/(key)

   Delete a scene.

   CAUTION: This will delete all information associated to a scene,
   including all registered devices.

   :statuscode 200: Success

.. include:: _examples/scene/scene_delete.rst

Scene Query
~~~~~~~~~~~

.. http:post:: /v1/scene/query

   Find scenes by one or more attributes, including distance.

   The fields ‘latitude’, ‘longitude’, and ‘distance’ should always
   appear together if present. The distance provided is taken in
   kilometers.

   Multiple scenes can be passed in the scene_list attribute, and the
   return value will be the sum of the results from each query.

   :reqheader Content-Type: Application/json
   :statuscode 200: Success

.. include:: _examples/scene/scene_query.rst
