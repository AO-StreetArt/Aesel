Streaming API
-------------

The Streaming API allows for rapid updates to Object Transformations and
Property Values.  These updates are streamed out to other devices registered
to the scene that contains the object.  This allows for live update streams
with absolute minimal overhead.

Once devices are rendering based on the objects in a scene,
this is the only method that should be used to update the transforms
of that object.  The standard API should still be used to update other
elements of the object, for example type or assets.

When utilizing the UDP API, there are several important things to remember:

- You will be provided with a hostname and port upon registration.  This is the address to which you will send UDP messages.
- In a secure environment, you will also be provided with encryption and decryption keys, which can be used to securely send UDP messages to the provided destination.
- UDP Messages follow the CLyman Event API (https://clyman.readthedocs.io/en/v2/pages/Events_API.html).
