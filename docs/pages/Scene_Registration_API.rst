Scene Registration API
======================

Devices need to register/de-register to scenes as they move around in
the world, and Aesel uses this information to determine what object
updates to stream out to that device. This API allows for registration,
de-registration, and synchronization of devices to scenes.

Scene Registration
~~~~~~~~~~~~~~~~~~

.. http:post:: /v1/scene/(key)/registration

   Devices are expected to register to scenes as they move through space.
   This tells Aesel what objects that device needs to receive information
   on. If the specified scene is not present, then it will be created.

   :reqheader Content-Type: Application/json
   :statuscode 200: Success

.. include:: _examples/scene/scene_register.rst

Scene De-Registration
~~~~~~~~~~~~~~~~~~~~~

.. http:post:: /v1/scene/(key)/deregister

   Devices are expected to register to scenes as they move through space.
   This tells Aesel what objects that device needs to receive information
   on. De-Registration occurs after a device has left the scene and joined
   others, and is now ready to stop receiving updates on objects within the
   old scene.

   Note that devices are expected to de-register only after registering
   with a new scene and performing any necessary corrections. This allows a
   network of transformations to be created, which can be used to
   pre-calculate those needed for future registrations.

   :statuscode 200: Success

.. include:: _examples/scene/scene_deregister.rst

Scene Synchronization
~~~~~~~~~~~~~~~~~~~~~

.. http:put:: /v1/scene/(key)/align

   Aesel will not always be able to supply a device with an accurate
   transformation upon registering to a scene. In particular, this will
   happen when the device first registers to a scene with no prior
   registrations, as well as when the network of transformations is first
   being built and collected. In these cases, the Device will need to
   supply Aesel with a correction in order to correct the transformation.

   :reqheader Content-Type: Application/json
   :statuscode 200: Success

.. include:: _examples/scene/scene_sync.rst
