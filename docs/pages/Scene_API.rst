Scene Creation/Update
~~~~~~~~~~~~~~~~~~~~~

.. http:post:: /v1/scene/(name)

   Create a new scene or update an existing one with name `name`.

   :<json string region: The region of the scene
   :<json float latitude: The latitude associated to the scene
   :<json float longitude: The longitude associated to the scene
   :<json list(string) assets: A list of string Asset ID's that should be downloaded on registration
   :<json list(string) tags: A list of string tags that can be used to search for scenes
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
   :>json list(string) assets: A list of string Asset ID's that should be downloaded on registration
   :>json list(string) tags: A list of string tags that can be used to search for scenes
   :statuscode 200: Success

.. include:: _examples/scene_get.rst

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
| DELETE   | *<base\_url>*/v1/scene/:name           |
+----------+----------------------------------------+

.. include:: _examples/scene_delete.rst

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

"name":"Test Scene 10",

"latitude":124.0,

"longitude":122.0,

"distance":100.0,

"region":"TestRegion5",

"asset_ids":["TestAsset10"],

"tags":["Testing2"]

}

.. include:: _examples/scene_query.rst
