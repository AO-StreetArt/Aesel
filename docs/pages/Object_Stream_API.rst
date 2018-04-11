Object Streaming API
--------------------

The Streaming API allows for rapid updates to Object Transformations.  These
updates are streamed out to other devices registered to the scene that contains
the object.  This allows for live update streams with absolute minimal overhead.

Once devices are rendering based on the objects in a scene,
this is the only method that should be used to update the transforms
of that object.  The standard API should still be used to update other
elements of the object, for example type or assets.

.. admonition:: Note

   We specify the keys for both object and scene (rather than names) in these messages.

Object Overwrite UDP
~~~~~~~~~~~~~~~~~~~~

In addition to the HTTP port (set by default to 5885), Aesel also exposes a UDP
port (by default set to 5886), which accepts JSON messages with the below format::

  {
    "key": "abc",
    "scene": "123",
    "translation": [0, 0, 1],
    "quaternion\_rotation": [0, 1, 0, 0],
    "euler\_rotation": [0, 0, 0],
    "scale": [1, 1, 2]
  }

This is currently far and away the fastest method of streaming updates to Aesel.

Object Overwrite HTTP
~~~~~~~~~~~~~~~~~~~~~

.. http:post:: /v1/object/(obj_key)

   Update an existing object with key `obj_key`.

   The HTTP response code only acknowledges receipt of the update.  Confirmation of
   update success is received asynchronously via UDP streams.  Because of the nature
   of UDP, it is possible that this message will be lost and no confirmation of update
   success will be received.

   :<json string scene: The key of the scene for the object
   :<json array(float) translation: The Translation of the object relative to the scene coordinate system
   :<json array(float) rotation\_quaternion: The Quaternion Rotation of the object relative to the scene coordinate system
   :<json array(float) rotation\_euler: The Euler Rotation of the object relative to the scene coordinate system
   :<json array(float) scale: The Scale of the object relative to the scene coordinate system
   :reqheader Content-Type: Application/json
   :statuscode 200: Success

.. include:: _examples/object/object_hsupdate.rst
