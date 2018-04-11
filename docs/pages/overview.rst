.. _overview:

What is Aesel
=============

Aesel builds on top of a traditional video game server by tracking relationships between coordinate systems.  This is a critical
component when supporting Augmented Reality clients who are rendering these objects on top of a view of real space.  In this case,
we can't assume that all of the devices are referencing the same origin point, as well as x, y, and z directions.  Aesel gives a
means of storing these transformations and calculating the transformations wherever possible.

Example: A Tale of Two Parties
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Let's say you just received a new phone and headset, and it is Augmented Reality Compatible.  You've downloaded a few applications
and toyed with the device on your own, but now you've been invited to two parties on Friday, with friends who also have
AR-compatible devices.  We'll call these friends Joe and Laura.  Our first step is to ask Aesel for information on their parties:

.. image:: _images/overview_intro.gif

.. note::
   Asking Aesel for information about your friend's parties amounts to executing a :ref:`Scene <vocab>` Query.  We can look for scenes
   based on names, regions, and tags, or we can look for scenes within a specific distance of our latitude/longitude.

   For example:

   .. include:: _examples/scene/scene_query.rst

After some thinking, you decide that Laura's party sounds like more fun.  As you enter her party, your device sends
a registration message to Aesel.  Aesel responds by informing you about all of the objects in the scene, as well as
any other information you need to render the
scene as a whole.  You download all of the data you need to actually visualize those objects from the server.

.. image:: _images/overview_register.gif

.. note::
   This exchange of information is initiated by a Scene Registration message:

   .. include:: _examples/scene/scene_register.rst

   After Registration, there may be a great deal of communication between the user's device and the Aesel server.  Rather than
   dumping all of the necessary information directly to the device, Aesel simply responds to a registration with the keys to
   find both it's :ref:`Assets <vocab>` and :ref:`Objects <vocab>`.  The client then responds with load messages for these records,
   so it loads each file on the server until the device has everything it needs.  For a more detailed explanation of the process involved
   in loading a scene, please see the :ref:`Loading a Scene <loading>` page.

Next, we need to correct our view with that of everyone else.  This can be done any number of ways (from a real reference
object to device-device communication), but once the right adjustments are made we send this information back to Aesel.

.. image:: _images/overview_sync.gif

.. note::
   The message to Aesel takes the form of a Scene Synchronization Message:

   .. include:: _examples/scene/scene_sync.rst

   We need to perform this step to determine the difference between the default coordinate system of your device, and the
   coordinate system of the :ref:`Scene <vocab>`.  This is the coordinate system that all of the objects are stored in,
   and that your device will need to use when referencing the scene.  Think of it this way: If I tell you that there is
   a cube located at the point (1, 2, 3), how do you know where (0, 0, 0) is?  If we don't agree, then we'll end up seeing
   the cube in different places.  However, this step can be skipped when Aesel is used for traditional video games or Virtual Reality.

Now, we can move around any of the virtual objects we downloaded right in front of us.  When we do, that information is
sent to Aesel and, from there, to everyone else at the party.

.. image:: _images/overview_update.gif

.. note::
   Here we utilize the Object Streaming API to move the object around:

   .. include:: _examples/object/object_hsupdate.rst

   Aesel provides live change feeds of :ref:`Object <vocab>` location, rotation, and scaling for any users registered to the :ref:`Scene <vocab>`
   containing that :ref:`Object <vocab>`.  These feeds are designed to be extremely high-speed, and are sent via UDP.

After playing in an augmented reality soccer game for a while at Laura's, you decide that it would be fun to head over
to Joe's for a while.  Apparently he's playing augmented reality paintball, and that sounds like a rush.  So, we send
another registration message to Aesel as we walk into his party.  And, just like before, we need to correct our view with that of everyone else.

.. image:: _images/overview_crossregister_correct.gif

.. note::
   This time, Aesel sees that you've corrected two different scenes that you've moved between,
   and it uses this information to calculate a general correction that can be used by anyone else going
   between these two parties.  This means that, if anyone else wants to switch parties, they will not need
   to perform any corrections.

We finish by de-registering from Laura's party, as we no longer need to know where her soccer ball is placed on
the field.

.. image:: _images/overview_deregister.gif

.. note::
   This message to Aesel comes as a De-Registration Message:

   .. include:: _examples/scene/scene_deregister.rst

   Notice that you only de-register after performing any corrections you need, and once you are synchronized
   we can leave the original scene.  Also note that you do not necessarily need to leave the original scene.
   You may also remain registered and continue receiving updates on all objects in both scenes.
