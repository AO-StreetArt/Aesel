Scene Creation/Update
~~~~~~~~~~~~~~~~~~~~~

When a device needs to create or update a new scene without registering
to it, this API is available.

+----------+----------------------------------------+
| Method   | Path                                   |
+----------+----------------------------------------+
| POST     | *<base\_url>*/v1/scene/:name           |
+----------+----------------------------------------+

Post Data
^^^^^^^^^

-  JSON Format
-  Includes lat/long information, tags, and a list of Asset IDs to
   associate to the Scene
-  Example:

{

"region":"US-MD",

"latitude":124.0,

"longitude":122.0,

"assets":["TestAsset10"],

"tags":["Testing2"]

}

.. include:: _examples/scene_create.rst

Scene Retrieval
~~~~~~~~~~~~~~~

Retrieve scene information. This includes region, name, tags, latitude,
and longitude.

+----------+----------------------------------------+
| Method   | Path                                   |
+----------+----------------------------------------+
| GET      | *<base\_url>*/v1/scene/:name           |
+----------+----------------------------------------+

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

"assets":["TestAsset10"],

"tags":["Testing2"]

}

.. include:: _examples/scene_query.rst
