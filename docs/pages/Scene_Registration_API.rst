Scene Registration API
======================

Devices need to register/de-register to scenes as they move around in
the world, and Aesel uses this information to determine what object
updates to stream out to that device. This API allows for registration,
de-registration, and synchronization of devices to scenes.

Scene Registration
~~~~~~~~~~~~~~~~~~

.. http:put:: /v1/scene/(name)/registration

   Devices are expected to register to scenes as they move through space.
   This tells Aesel what objects that device needs to receive information
   on. If the specified scene is not present, then it will be created.

   :query string device\_id:  Required. Unique identifier for the device registering to the scene.
   :query string device\_host:  Required. Hostname of the device for UDP streaming.
   :query string device\_id:  Required. Port of the device for UDP Streaming.
   :<json array(float) translation: Optional.  The translation of the device relative to the scene coordinate system.
   :<json array(float) rotation: Optional.  The rotation of the device relative to the scene coordinate system.
   :reqheader Content-Type: Application/json
   :statuscode 200: Success

.. include:: _examples/scene/scene_register.rst

Scene De-Registration
~~~~~~~~~~~~~~~~~~~~~

.. http:delete:: /v1/scene/(name)/registration

   Devices are expected to register to scenes as they move through space.
   This tells Aesel what objects that device needs to receive information
   on. De-Registration occurs after a device has left the scene and joined
   others, and is now ready to stop receiving updates on objects within the
   old scene.

   Note that devices are expected to de-register only after registering
   with a new scene and performing any necessary corrections. This allows a
   network of transformations to be created, which can be used to
   pre-calculate those needed for future registrations.

   :query string device\_id:  Required. Unique identifier for the device registering to the scene.
   :statuscode 200: Success

.. include:: _examples/scene/scene_deregister.rst

Scene Synchronization
~~~~~~~~~~~~~~~~~~~~~

.. http:put:: /v1/scene/(name)/registration

   Aesel will not always be able to supply a device with an accurate
   transformation upon registering to a scene. In particular, this will
   happen when the device first registers to a scene with no prior
   registrations, as well as when the network of transformations is first
   being built and collected. In these cases, the Device will need to
   supply Aesel with a correction in order to correct the transformation.

   :query string device\_id:  Required. Unique identifier for the device registered to the scene.
   :<json array(float) translation: Required.  The translation of the device relative to the scene coordinate system.
   :<json array(float) rotation: Required.  The rotation of the device relative to the scene coordinate system.
   :reqheader Content-Type: Application/json
   :statuscode 200: Success

.. include:: _examples/scene/scene_sync.rst
