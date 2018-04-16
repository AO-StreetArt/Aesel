Aesel Zero Latency Streaming Design
===================================

Section 1: Abstract
-------------------

This document outlines the design for Phase 3 of the Distributed
Visualization Server.  The primary focus of this effort is to reduce network
latency within high-availability deployments of Aesel.

One of the primary benefits that Aesel provides is as a back-end server
that can be deployed across cloud networks, with enough speed to power
a traditional multi-player video game.  A single-server deployment should be
capable of meeting the performance requirements, but not scalability.  However,
due to the expected network latencies present within the network of a cloud
provider, we are not able to guarantee that such a deployment will meet
the performance requirements.  We need to support a cloud-native, zero-latency
solution.

Section 2: Components
~~~~~~~~~~~~~~~~~~~~~

.. include:: insert/components_insert.rst

Section 3: Vocabulary
---------------------

.. include:: insert/vocab.rst

Section 4: Overview
-----------------------

Zero-latency means that there can be submillisecond network latency incurred
from receipt of an Object Update (as detailed in the Aesel High Speed Streaming
Design), to output of the Change Stream to other registered devices.

To accomplish this, CLyman and CrazyIvan can be packaged into a single component,
communicating over Inter-Process Communication through a ZeroMQ Pub-Sub model.
This replaces Kafka in the deployment model with the ZMQ Pub-Sub communication,
and each pair is given only the information for it's partner to communicate with.

Upon registration to a Scene, a Device is provided with a UDP endpoint it can
use to send in updates directly.  It sends it's messages directly to the CLyman
UDP endpoint, which forwards the message over IPC to CrazyIvan.  CrazyIvan then
initiates UDP messages out.

This does mean, however, that if either of the services fail, then the pair are
both invalid.  We'll have to aggressively health check them to detect when failures
occur, because clients will just keep sending messages and won't receive any
sort of response.

Adrestia will need significant changes in order to recognize specific server pairs
associated to a region.  More details in section

Section 5: In-Memory Caching
----------------------------

In-memory caching can be used to prevent repeated network calls within Crazy Ivan

* On receipt of kafka update, add scene to time-expired cache of scene ID's
* Check Scene-Device cache (seperate, time-expired cache of scene ID's and device info) for scene
* If not present, execute query & populate. If configured to still send updates, do so
* If present, send update
* On background thread, periodically query Neo4j and populate Scene-Device cache
* Crazy Ivan should always keep in memory those scenes in it's region (per region-specific server pairs)

Section 6: CLyman UDP Endpoint
------------------------------

CLyman needs to be able to accept Object Overwrite messages via UDP, mimicking the
UDP API exposed by Adrestia.

Section 7: ZMQ Pub-Sub Change Streams
-------------------------------------

CLyman and Crazy Ivan both need to be updated to support configurable change
stream back-ends, either Kafka or ZMQ.

The ZMQ Model should use Pub-Sub to communicate with a particular instance of
Crazy Ivan, and should support IPC, ITC, as well as TCP.

Section 8: Region-Specific Server Pairs
---------------------------------------

Clyman/CrazyIvan pairs will need to register as pairs with Consul, making them
distinct enough to register the pairing within Adrestia.  They will also need to
register to the specified region.

Adrestia will need to provide the address of particular pairs of CLyman/CrazyIvan
to devices upon registration.  The devices can then send UDP updates directly to
CLyman

Section 9: Required Changes
---------------------------

* Add UDP Endpoint to CLyman
* Add configurable option for ZMQ Pub-Sub model or Kafka model of deployment
* Add IPC Support to ZeroMQ Driver in AOSSL
* Add configurable logic in Adrestia to pass UDP endpoints to devices
* Add Scene-Device Caching logic in CrazyIvan so no DB calls need to be made
* Aggressive health-checking of CLyman & Crazy Ivan service pairs
* Logic in Adrestia to provide an updated UDP endpoint to devices on failure
