Scene Registration
~~~~~~~~~~~~~~~~~~

Devices are expected to register to scenes as they move through space.
This tells Aesel what objects that device needs to receive information
on. If the specified scene is not present, then it will be created.

+----------+-----------------------------------------------------+
| Method   | Path                                                |
+----------+-----------------------------------------------------+
| PUT      | *<base\_url>*/v1/scene/:region/:name/registration   |
+----------+-----------------------------------------------------+

Parameters
^^^^^^^^^^

-  device\_id (string) – Required. Unique identifier for the device
   registering to the scene

Sample Request
^^^^^^^^^^^^^^

\`$ curl -X PUT
`http://aesel-test/v1/scene/ <http://aesel-test/v1/scene/us-md-mc/wjhs/registration?device_id=abcdef123>`__\ `us-md-mc/wjhs/registration?device\_id=abcdef123 <http://aesel-test/v1/scene/us-md-mc/wjhs/registration?device_id=abcdef123>`__\ \`

Sample Response
^^^^^^^^^^^^^^^

{

“num\_records”:1, “scenes”:[

{

“key”:”jklmnop”,

“devices”:[

{

“key”:”Ud\_132”,

“transform”:{

“translation”:[0.0,0.0,0.0],

”rotation”:[0.0,0.0,0.0]

}

}

]

}

]

}

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
| DELETE   | *<base\_url>*/v1/scene/:region/:name/registration   |
+----------+-----------------------------------------------------+

Parameters
^^^^^^^^^^

-  device\_id (string) – unique identifier for the device registering to
   the scene

Sample Request
^^^^^^^^^^^^^^

\`$ curl -X DELETE
`http://aesel-test/v1/scene/ <http://aesel-test/v1/scene/us-md-mc/wjhs/registration?device_id=abcdef123>`__\ `us-md-mc/wjhs/registration?device\_id=abcdef123 <http://aesel-test/v1/scene/us-md-mc/wjhs/registration?device_id=abcdef123>`__\ \`

Sample Response
^^^^^^^^^^^^^^^

No JSON Response, only HTTP Success/Error Code

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
| POST     | *<base\_url>*/v1/scene/:region/:name/registration   |
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

Sample Request
^^^^^^^^^^^^^^

\`$ curl -H “Content-Type: application/json” -X POST -d ‘DATA\_STRING’
`http://aesel-test/v1/scene/ <http://aesel-test/v1/scene/us-md-mc/wjhs/registration?device_id=abcdef123>`__\ `us-md-mc/wjhs/registration?device\_id=abcdef123 <http://aesel-test/v1/scene/us-md-mc/wjhs/registration?device_id=abcdef123>`__\ \`

Sample Response
^^^^^^^^^^^^^^^

No JSON Response, only HTTP Success/Error Code
