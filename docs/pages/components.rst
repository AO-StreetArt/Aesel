.. _components:

Aesel Components
================

:ref:`Go Home <index>`

Aesel is not actually a single program, but a number of programs all running independently
and communicating with each other.  This allows for built-in redundancy to achieve
both high-availability, and scalablity to respond quickly to large changes in volume.

Below you can find the components that comprise the Aesel Architecture:

Adrestia
--------

Adrestia acts as the HTTP Gateway for external clients into Aesel.  It abstracts
away the various clusters of event-based components into a single transactional
plane for both users and other services to utilize.

* `Home Page <https://github.com/AO-StreetArt/Adrestia>`__
* `Documentation <http://adrestia.readthedocs.io/en/latest/>`__

Kelona
------

Kelona stores graphics assets, and tracks various versions of those assets over
time.  Effectively, it acts as a Version Control System for large-scale, binary files
for large-scale userbases.

* `Home Page <https://github.com/AO-StreetArt/Kelona>`__
* `Documentation <http://kelona.readthedocs.io/en/latest/>`__

AeselProjects
-------------

AeselProjects stores project management information for collaborative 3-D
projects (ie. Animation, Product Design, etc).  This provides organizational
capabilities and a rich User Experience on large projects.

* `Home Page <https://github.com/AO-StreetArt/AeselProjects>`__
* `Documentation <https://aeselprojects.readthedocs.io/en/latest/>`__

CLyman
------

CLyman is a service working in the domain of Renderable Objects.  It exposes CRUD
operations, and is the starting point of the Outbound Streaming API's.

* `Home Page <https://github.com/AO-StreetArt/CLyman>`__
* `Documentation <http://clyman.readthedocs.io/en/latest/index.html>`__

Crazy Ivan
----------

Crazy Ivan is a service working in the domain of Scenes.  It exposes CRUD operations for scenes,
as well as registration operations.  It also acts as the sender for the Outbound Streaming API's.

* `Home Page <https://github.com/AO-StreetArt/CrazyIvan>`__
* `Documentation <http://crazyivan.readthedocs.io/en/latest/index.html>`__

Mongo
-----

Mongo serves as the primary data store behind CLyman, storing all Object information.

Mongo GridFS also serves as the default data store for Assets.

* `Home Page <https://docs.mongodb.com/>`__

Neo4j
-----

Neo4j serves as the primary data store behind Crazy Ivan, storing all Scene information.

* `Home Page <https://neo4j.com/developer/get-started/>`__

Consul
------

Consul serves as both a service registry and a distributed configuration store.

* `Home Page <https://www.consul.io/>`__
