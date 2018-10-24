.. _quickstart:

Getting Started with Aesel
==========================

System Requirements
-------------------

.. include:: insert/system_reqs.rst

Docker
------

.. include:: insert/docker.rst

Starting Aesel
--------------

First, Download the Aesel setup files from https://github.com/AO-StreetArt/Aesel/archive/master.zip.

Unzip the files, and open a terminal/command prompt from the main folder.

Run the following commands:

``cd compose``

``cd min``

``docker-compose up``

.. admonition:: Note

   You will need the environment variable NETWORK_INTERFACE_ADDRESS set to your IP address for the development cluster
   UDP API to function correctly.  On Linux, this can be accomplished with:

   * export NETWORK_INTERFACE_NAME=$(route | grep '^default' | grep -o '[^ ]*$')
   * export NETWORK_INTERFACE_ADDRESS=$(ip addr show $NETWORK_INTERFACE_NAME | grep -Po 'inet \K[\d.]+')

Congratulations, Aesel is now up and running on your computer!  To make sure that everything started
correctly, open up your web browser after about 30 seconds and go to the address http://localhost:8080/health.
You should see that STATUS is UP.

Interacting with Aesel
----------------------

Aesel's HTTP API will be available at http://localhost:8080.  The UDP API for CLyman
(https://clyman.readthedocs.io/en/v2/pages/Events_API.html) is available at localhost:8762.

The following user interfaces will be available by default:

* `Consul <https://www.consul.io/>`__ (Configuration, System Status) - http://localhost:8500/ui
* `Neo4j <https://neo4j.com/>`__ (Database storing Scene information) - http://localhost:7474

I recommend `MongoDB Compass <https://www.mongodb.com/products/compass>__`, Community Edition,
which can connect on localhost:27017.  `Mongo <https://www.mongodb.com/>`__ is the
database which stores object, property, asset, and routing information.

:ref:`Continue on to the overview to read more about interacting with Aesel<tests>`
