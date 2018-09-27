.. _deployment:

Deploying Aesel
===============

:ref:`Go Home <index>`

System Requirements
-------------------

.. include:: insert/system_reqs.rst

Note that the above recommendations are minimum requirements, and production deployments
will likely require significantly more resources, especially when handling very high-volumes
of traffic.

Scalability
-----------

Aesel is built to be horizontally scalable, so it can also run across multiple servers.

Crazy Ivan, CLyman, and Mongo form separate clusters which each manage disparate
scenes.  Adrestia forms a Service Mesh on top of these clusters, allowing transparent,
transactional access.  Neo4j, Adrestia, and Kelona are all completely horizontally
scalabale, with many instances able to run simultaneously.

Consul Agents should run on each server as well.  Mongo and Neo4j can all
be clustered to increased scalability for the underlying data stores.

Docker
------

Docker images are available for all system components, so Aesel can be deployed on
any architecture that supports Docker (ie. Docker Swarm or Kubernetes).

Load Balancing
--------------

Adrestia serves as the gateway for both HTTP, and will automatically
load balance between instances of CLyman/Crazy Ivan.  An HTTP reverse proxy (such as NGINX) can be
used to balance between instances of Adrestia for HTTP requests, if desired.

When a device registers to a scene, it is provided an instance of CLyman to
send updates to.  This means that the UDP streaming is inherently load balanced
within each cluster.

Security
--------

Currently, security components are not active within all Aesel components.  Until that time,
it is not advised that Aesel be deployed in such a way as to be accessible on a public network.
