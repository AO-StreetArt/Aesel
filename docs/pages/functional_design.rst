.. _func_design:

Aesel Design
============

Section 1: Abstract
-------------------

This document outlines the design for Phase 1 of the Distributed
Visualization Server. This is a system for allowing many different user
devices to visualize the same 3-Dimensional objects in real-time. While
additional workflows are planned, they will not be outlined within this
document.

This consists of a number of different components, so this document will
focus on integration-driven flows. The document will proceed on a
workflow-by-workflow basis and provide the basis for a solid API design.

Workflows
~~~~~~~~~

The following workflows will be outlined in the below document:

-  Device-Scene Registration & Exit
-  Device Scene Transfer
-  Device-Scene Coordinate Synchronization
-  Scene-Scene Coordinate Synchronization
-  Object Creation & Destruction
-  Object Update (Location/Rotation/Scale)
-  Object Update (Assets)
-  Object Retrieval
-  Object Lock & Unlock

Components
~~~~~~~~~~

.. include:: components_insert.rst

Section 2: Vocabulary
---------------------

.. include:: vocab.rst

Section 3: Individual Workflows
-------------------------------

Device-Scene Registration
~~~~~~~~~~~~~~~~~~~~~~~~~

Device-Scene Registration occurs when a User Device either:

-  First joins the overall network
-  Changes scenes within the network

Input
^^^^^

The following are necessary inputs for this workflow:

-  Device Location – Current Latitude/Longitude of the device.
-  Group Name – The name of the device group to be joined
-  Device ID – If we are changing scenes, then we include a device ID.

Processing
^^^^^^^^^^

Upon receiving the request from the client, we send a message to the
Scene module requesting registration. When registration is successful,
we return the Scene ID and the Obj3 ID's to be pulled.

Output
^^^^^^

The following are the outputs for this workflow:

-  Device ID – If we are registering within the network for the first
   time, the device ID is returned as an output
-  Scene ID – The Unique Identifier for the scene the device is now
   registered to
-  Coordinate System – The Coordinate System information of the new
   scene (transformation from scene coordinate system to device
   coordinate system)
-  Object ID's – Unique Identifiers for the Objects to be retrieved by
   the device

Device Scene Transfer
~~~~~~~~~~~~~~~~~~~~~

A Scene Transfer occurs when an object is removed from it's current
scene, and is registered to a new scene.

Input
^^^^^

The following are necessary inputs for this workflow:

-  Initial Scene
-  New Scene

Processing
^^^^^^^^^^

If a calculable coordinate system transform is available, then it is
returned to the device. Otherwise, it is approximated and a flag is
returned notifying the user device that Scene-Scene coordinate
synchronization is needed.

Output
^^^^^^

The following are the outputs for this workflow:

-  Coordinate System – The Coordinate System information of the new
   scene (transformation from old scene to new)

Device-Scene Coordinate Synchronization
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Device-Coordinate Synchronization occurs when a User Device wishes to
re-calibrate it's current scene transformation relative to it's local
coordinate system.

Input
^^^^^

The following are necessary inputs for this workflow:

-  Coordinate System – A Transformation from the scene coordinate system
   to the user device local coordinate system

Processing
^^^^^^^^^^

This message is used to dial-in scene transformations. Upon receiving
the request from the client, we send a message to the Scene module and
pass back the confirmation.

Output
^^^^^^

Confirmation or Error

Scene-Scene Coordinate Synchronization
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Scene-Scene Coordinate Synchronization occurs when a User Device wishes
to re-calibrate it's current scene transformation relative to it's
previous scene.

Input
^^^^^

The following are necessary inputs for this workflow:

-  Coordinate System – A Transformation from the scene coordinate system
   to the user device local coordinate system

Processing
^^^^^^^^^^

This message is used to dial-in scene-scene transformations. Upon
receiving the request from the client, we send a message to the Scene
module and pass back the confirmation.

Output
^^^^^^

Confirmation or Error

Device-Scene Exit
~~~~~~~~~~~~~~~~~

Device-Scene Exit occurs whenever a user device leaves a scene

Input
^^^^^

The following are the inputs for this workflow:

-  Device ID – The Unique Identifier for the device
-  Scene ID – The Unique Identifier for the scene the device is
   currently registered to

Processing
^^^^^^^^^^

Upon receiving the request from the client, we send a message to the
Scene module requesting de-registration. When de-registration is
successful, we return the confirmation.

Output
^^^^^^

Confirmation or Error

Object Creation
~~~~~~~~~~~~~~~

Object Creation is the act of making a new Object across all User
Devices.

Input
^^^^^

-  Object Information
-  Mesh Information
-  Any other information (shader, etc)
-  Scene ID

Processing
^^^^^^^^^^

Upon receiving the request from the client, a message is sent to the
Scene Module with all the information. The object is added to the scene
within the Scene Module. Then, a message is sent to Ceph to save the
Mesh, Shader, and other information. Then, the resulting keys are added
and the rest of the information is saved to Clyman, which generates an
outbound message on the response streams in the gateway.

Output
^^^^^^

-  Outbound message to User Devices of newly created object and all
   associated assets that need to be downloaded
-  Confirmation or Error

Object Destruction
~~~~~~~~~~~~~~~~~~

Object Destruction is called to remove an Object from all User Devices

Input
^^^^^

-  Object ID – The Unique Identifier for the Object (from CLyman)

Processing
^^^^^^^^^^

Upon receiving the request from the client, a message is sent to the
Scene Module with all the information. The object is removed from the
scene within the Scene Module. Next, the Asset ID's are retrieved from
Clyman. Then, a message is sent to Ceph to remove the Mesh, Shader, and
other information. Then, the rest of the information is removed from
Clyman, which generates an outbound message on the response streams in
the gateway.

Output
^^^^^^

-  Outbound message to User Devices of newly deleted object and all
   associated assets that need to be removed
-  Confirmation or Error

Object Update (Location/Rotation/Scale)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

An Object Update, or Transformation, is a special flow in that it only
hits Clyman. These are designed for high-speed processing, and generate
outbound messages to update all devices of the changes.

Input
^^^^^

-  Object ID – The Unique Identifier for the Object (from Clyman)
-  Transformation – The actual transformation to be applied
   (Translation, Rotation, Scale)

Processing
^^^^^^^^^^

Upon receiving the request from the client, a message is sent to Clyman
to apply the transformations specified. This generates an outbound
message on the response streams in the gateway.

Output
^^^^^^

-  Outbound message to User Devices of newly created object and all
   associated assets that need to be downloaded
-  Confirmation or Error

Object Update (Assets)
~~~~~~~~~~~~~~~~~~~~~~

Object Asset Update is called to edit the assets that make up an Object,
and push the update to all User Devices.

Input
^^^^^

-  Object ID – The Unique Identifier for the Object
-  Asset Information – The new information to use for the asset

Processing
^^^^^^^^^^

Upon receiving the request from the client, a message is sent to Ceph to
overwrite the data there. Then, a mesh update message is sent to Clyman,
which generates an outbound message on the response streams in the
gateway.

Output
^^^^^^

-  Outbound message to User Devices of newly created object and all
   associated assets that need to be downloaded
-  Confirmation or Error

Object Retrieval
~~~~~~~~~~~~~~~~

Object Retrieval comes when a Device needs to load the assets and
transform information for an Object.

Input
^^^^^

-  Object ID – The Unique Identifier for the Object

Processing
^^^^^^^^^^

Upon receiving the request from the client, a message is sent to Clyman
to retrieve the Transformation information and Asset ID's. Then, the
Asset ID's are used in messages to Ceph to retrieve the asset
information. All of this information is assembled and passed back to the
Device.

Output
^^^^^^

-  Transformation Information – The current location, rotation, scaling
   for the Object
-  Asset Information – The assets needed to re-create the object

Object Lock
~~~~~~~~~~~

A User Device Lock is used to prevent other User Devices from updating
an Object, until it is released.

Input
^^^^^

-  Object ID – The Unique Identifier for the Object
-  Device ID – The Unique Identifier for the device

Processing
^^^^^^^^^^

Upon receiving the request from the client, a message is sent to Clyman
to establish the transformation lock.

Output
^^^^^^

-  Confirmation or Error

Object Unlock
~~~~~~~~~~~~~

Releasing a User Device Lock allows other Devices to establish locks or
update the Object.

Input
^^^^^

-  Object ID – The Unique Identifier for the Object
-  Device ID – The Unique Identifier for the device

Processing
^^^^^^^^^^

Upon receiving the request from the client, a message is sent to Clyman
to release the transformation lock.

Output
^^^^^^

-  Confirmation or Error

Section 4: Configuration Options
--------------------------------

Several Configuration Options will be available within the DVS Server,
each with different objectives.

Transaction ID
~~~~~~~~~~~~~~

Each Service will either accept or generate a transaction ID, such that
any individual transaction with a User Device can be traced through each
service that it hits.
