.. _loading:

Loading an Aesel Scene
======================

Once registered to a Scene, a device needs to actually load all of the data that
comprises this full 3-D Environment.  This can contain an enormous amount of different
types of data, such as (but not limited to):

-  Mesh Data (.obj)
-  Animation Data (.fbx)
-  Shader Data (.glsl)
-  Texture Data (.png)

These are just a few examples of the multitude of types of information that may be present,
and we boil these all down to one term: 'Assets'.

Assets may be present for the Scene (such as a reference image or map/level data), as well
as for individual objects (which also have an associated location, rotation, and scale within
the scene).  So, our process of loading a scene boils down to a few simple steps:

-  Load Scene
-  Load Scene Assets
-  Load Scene Objects
-  Load Object Assets

Loading Scenes
~~~~~~~~~~~~~~

Loading a Scene can be done either with a Scene Retreival:

.. include:: _examples/scene/scene_get.rst

or, we can find Scenes with a Scene Query:

.. include:: _examples/scene/scene_query.rst

Loading Scene Assets
~~~~~~~~~~~~~~~~~~~~

Now that we have our scene, we issue an Asset Retrieval Message for each key listed in the 'assets' field:

.. include:: _examples/asset/asset_get.rst

Loading Scene Objects
~~~~~~~~~~~~~~~~~~~~~

We can issue an Object Query to pull the Objects in a Scene, and if all parameters are
left out of the request, than all Objects in the scene will be returned:

.. include:: _examples/object/object_query.rst

Loading Object Assets
~~~~~~~~~~~~~~~~~~~~~

Loading Object Assets follows exactly the same process as retrieving Scene Assets,
only using the keys listed in the 'assets' field from the Object:

.. include:: _examples/asset/asset_get.rst
