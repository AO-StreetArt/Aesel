Scene Registration
~~~~~~~~~~~~~~~~~~

Devices are expected to register to scenes as they move through space.
This tells Aesel what objects that device needs to receive information
on. If the specified scene is not present, then it will be created.

+----------+-----------------------------------------------------+
| Method   | Path                                                |
+----------+-----------------------------------------------------+
| PUT      | *<base\_url>*/v1/scene/:name/registration           |
+----------+-----------------------------------------------------+

Parameters
^^^^^^^^^^

-  device\_id (string) – Required. Unique identifier for the device
   registering to the scene
-  device\_host (string) - Required.  Hostname of the device for UDP Communications
-  device\_port (integer) - Required.  Port of the device for UDP Communications

Put Data
^^^^^^^^

 -  Optional
 -  JSON Format
 -  Includes Translation and Rotation, relative to the scene
 -  Example:

 {

 translation: [0,0,0],

 rotation: [45,1,0,0]

 }

.. include:: _examples/scene_register.rst

Scene De-Registration
~~~~~~~~~~~~~~~~~~~~~

Devices are expected to register to scenes as they move through space.
This tells Aesel what objects that device needs to receive information
on. De-Registration occurs after a device has left the scene and joined
others, and is now ready to stop receiving updates on objects within the
old scene.

Note that devices are expected to de-register only after registering
with a new scene and performing any necessary corrections. This allows a
network of transformations to be created, which can be used to
pre-calculate those needed for future registrations.

+----------+-----------------------------------------------------+
| Method   | Path                                                |
+----------+-----------------------------------------------------+
| DELETE   | *<base\_url>*/v1/scene/:name/registration           |
+----------+-----------------------------------------------------+

Parameters
^^^^^^^^^^

-  device\_id (string) – unique identifier for the device registering to
   the scene

.. include:: _examples/scene_deregister.rst

Scene Synchronization
~~~~~~~~~~~~~~~~~~~~~

Aesel will not always be able to supply a device with an accurate
transformation upon registering to a scene. In particular, this will
happen when the device first registers to a scene with no prior
registrations, as well as when the network of transformations is first
being built and collected. In these cases, the Device will need to
supply Aesel with a correction in order to correct the transformation.

+----------+-----------------------------------------------------+
| Method   | Path                                                |
+----------+-----------------------------------------------------+
| POST     | *<base\_url>*/v1/scene/:name/registration           |
+----------+-----------------------------------------------------+

Parameters
^^^^^^^^^^

-  device\_id (string) – unique identifier for the device registered to
   the scene

Post Data
^^^^^^^^^

-  JSON Format
-  Includes Translation and Rotation, relative to the scene
-  Example:

{

translation: [0,0,0],

rotation: [45,1,0,0]

}

.. include:: _examples/scene_sync.rst
