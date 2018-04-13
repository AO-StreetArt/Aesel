.. _streaming_design:

Aesel High Speed Streaming Design
=================================

Section 1: Abstract
-------------------

This document outlines the design for Phase 2 of the Distributed
Visualization Server.  The primary focus of this component is one thing and one
thing only: speed.  Updates on object location, rotation, and scaling need to be
streamed out to devices with absolute minimal overhead, and must meet a minimum of
24 updates against a single object per second.  A more realistic goal would be
upwards of 40 updates against a single object per second.

Workflows
~~~~~~~~~

The following workflows will be outlined in the below document:

-  Object Update High Speed Input
-  Object Update Output Streams

Components
~~~~~~~~~~

.. include:: insert/components_insert.rst

Section 2: Vocabulary
---------------------

.. include:: insert/vocab.rst

Section 3: Workflow Overviews
-----------------------------

Object Update High Speed Input
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The high speed input exposure will allow devices registered to a scene to send in an update
to object location, rotation, and scaling with minimal overhead and handling.  Upon receipt of
the message, Aesel should initiate it's Object Update Output Streams, as described in the next
section.

Input
^^^^^

The high speed input will accept only an update on location, rotation, or scaling against
an object in a particular scene.  No other object attributes can be updated this way.

Processing
^^^^^^^^^^

The high speed input should both initiate the Object Update Output Streams, as well as persist the
update into CLyman.

Output
^^^^^^

The high speed input should have little to no output, with a fire-and-forget methodology.

Object Update Output Streams
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The Object Update Output Streams will push any object update made to location, rotation, or scaling out to all the devices
registered to that object's Scene.  This will be a joint effort between CLyman, Crazy Ivan, and an intermediary queue

Input
^^^^^

The output streams will be initiated by the high speed input workflow, and so do not require any explicit user input directly.

Processing
^^^^^^^^^^

After being initiated by the high speed input flow, the following workflow should occur:

* CLyman places an update onto the intermediary queue
* Crazy Ivan picks update off of intermediary queue
* Crazy Ivan identifies other devices registered to same scene

Output
^^^^^^

The output streams will send a UDP message containing the updated object state from Crazy Ivan to all devices registered to the object's scene.

Section 4: Required Changes
---------------------------

Object Update High Speed Input
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* CLyman needs a new message type which allows for an update without first retrieving the object from Mongo.  This means the user needs to send in the current position of the object, not the change from the last position.
* Adrestia needs a new API exposure which allows for an update directly against the object key.  We only communicate with CLyman when this is called, and we do so asynchronously.
* Start Outbound Change Feeds (Documented below) asynchronously upon receipt of message

Object Update Output Streams
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Add support and dependencies for Apache Kafka (Intermediate Queue) into both CLyman and Crazy Ivan (https://github.com/mfontanini/cppkafka)
* Add Kafka instance to Docker file(s) and Travis CI for CLyman, Crazy Ivan, Adrestia (https://hub.docker.com/r/spotify/kafka/)
* Add support and dependencies for UDP transmission into Crazy Ivan (http://www.boost.org/doc/libs/1_62_0/doc/html/boost_asio/overview/networking/protocols.html)
* Add Change Stream Logic to CLyman, upon update produce a new message with the new object attributes and send to Kafka
* Add Change Stream Logic to Crazy Ivan, continually monitor Kafka cluster for new messages.  Upon recieving, send UDP messages to all registered devices.
