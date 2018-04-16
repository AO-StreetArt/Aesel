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

Adrestia, Crazy Ivan, and CLyman can all be run with multiple independent instances on
independent servers.  Consul Agents should run on each server as well.  Mongo, Kafka, and
Neo4j can all be clustered to increased scalability for the underlying data stores.

Docker
------

Docker images are available for all system components, so Aesel can be deployed on
any architecture that supports Docker (ie. Docker Swarm or Kubernetes).

Load Balancing
--------------

Adrestia serves as the gateway for both HTTP and UDP, and will automatically
load balance between instances of CLyman/Crazy Ivan.  An HTTP reverse proxy (such as NGINX) can be
used to balance between instances of Adrestia for HTTP requests, but there is currently no good way
to balance the UDP requests between the instances outside the client.

The planned changes for the Zero Latency Design are expected to address this shortcoming
and allow Adrestia to sit completely behind an HTTP Reverse Proxy, with CLyman providing
the UDP API.

Security
--------

Currently, security components are not active within Aesel.  Until that time,
it is not advised that Aesel be deployed in such a way as to be accessible on a public network.
