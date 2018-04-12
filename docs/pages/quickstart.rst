.. _quickstart:

Getting Started with Aesel
==========================

System Requirements
-------------------

In order to run Aesel, you should have at least:

* 8GB RAM Available
* 4GB Hard Disk Space Available

Docker
------

The easiest way to get started with Aesel is with `Docker <https://www.docker.com/>`__
and `Docker Compose <https://docs.docker.com/compose/>`__.  Before continuing,
please be sure to follow the steps in the following links:

* https://docs.docker.com/install/
* https://docs.docker.com/compose/install/

.. admonition:: Note

   * Docker Community Edition is more than sufficient, but if you already have a subscription
   to Docker Enterprise, that will work perfectly well too.
   * Windows users will typically have compose installed with Docker, and won't need to follow
   the steps in the second link.

Starting Aesel
--------------

First, Download the Aesel setup files from https://github.com/AO-StreetArt/Aesel/archive/master.zip.

Unzip the files, and open a terminal/command prompt from the main folder.

Run the following commands:

``cd compose``
``cd min``
``docker-compose up``

.. admonition:: Note

   Linux users may need to call ``sudo docker-compose up``, depending on how you have installed Docker.

Congratulations, Aesel is now up and running on your computer!  To make sure that everything started
correctly, open up your web browser after about 30 seconds and go to the address http://localhost:5885/health.
You should see that STATUS is UP.

Interacting with Aesel
----------------------

Aesel's HTTP API will be available at http://localhost:5885, and the UDP API will be
available at localhost:5886.

The following user interfaces will be available by default:

* `Consul <https://www.consul.io/>`__ (Configuration, System Status) - http://localhost:8500/ui
* `Neo4j <https://neo4j.com/>`__ (Database storing Scene information) - http://localhost:7474

I recommend `MongoDB Compass <https://www.mongodb.com/products/compass>__`, Community Edition,
which can connect on localhost:27017.  `Mongo <https://www.mongodb.com/>`__ is the
database which stores object and asset information.
