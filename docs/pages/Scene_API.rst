Scene Creation/Update
~~~~~~~~~~~~~~~~~~~~~

.. http:post:: /v1/scene/(name)

   Create a new scene or update an existing one with name `name`.

   :<json string region: The region of the scene
   :<json float latitude: The latitude associated to the scene
   :<json float longitude: The longitude associated to the scene
   :<json array(string) assets: A list of string Asset ID's that should be downloaded on registration
   :<json array(string) tags: A list of string tags that can be used to search for scenes
   :>json string key: The key of the scene, for use in Object Change Streams
   :reqheader Content-Type: Application/json
   :statuscode 200: Success

.. include:: _examples/scene_create.rst

Scene Retrieval
~~~~~~~~~~~~~~~

.. http:get:: /v1/scene/(name)

   Retrieve scene information for scene `name`. This includes key, region, tags, latitude, and longitude.

   :>json string key: The key of the scene, for use in Object Change Streams
   :>json string region: The region of the scene
   :>json float latitude: The latitude associated to the scene
   :>json float longitude: The longitude associated to the scene
   :>json array(string) assets: A list of string Asset ID's that should be downloaded on registration
   :>json array(string) tags: A list of string tags that can be used to search for scenes
   :statuscode 200: Success

.. include:: _examples/scene_get.rst

Scene Deletion
~~~~~~~~~~~~~~

.. http:delete:: /v1/scene/(name)

   Delete a scene.

   CAUTION: This will delete all information associated to a scene,
   including all objects in the scene, and any registrations to devices.
   Any object which needs to be retained should be moved to another scene
   prior to deletion.

   :statuscode 200: Success

.. include:: _examples/scene_delete.rst

Scene Query
~~~~~~~~~~~

.. http:post:: /v1/scene/data

   Devices can find scenes by any attribute, including distance.

   The fields ‘latitude’, ‘longitude’, and ‘distance’ should always
   appear together if present. The distance provided is taken in
   kilometers.

   :<json string name: The name of the scene
   :<json string region: The region of the scene
   :<json float latitude: The latitude associated to the scene
   :<json float distance: The latitude associated to the scene
   :<json float longitude: The longitude associated to the scene
   :<json list(string) assets: A list of string Asset ID's that should be downloaded on registration
   :<json list(string) tags: A list of string tags that can be used to search for scenes
   :>json int num\_records: The number of scenes returned in the response
   :>json array scenes: A List of Scene objects which match the query
   :>jsonarr string key: The key of the scene, for use in Object Change Streams
   :>jsonarr string name: The name of the scene
   :>jsonarr string region: The region of the scene
   :>jsonarr float latitude: The latitude associated to the scene
   :>jsonarr float longitude: The longitude associated to the scene
   :>jsonarr array(string) assets: A list of string Asset ID's that should be downloaded on registration
   :>jsonarr array(string) tags: A list of string tags that can be used to search for scenes
   :reqheader Content-Type: Application/json
   :statuscode 200: Success

.. include:: _examples/scene_query.rst
