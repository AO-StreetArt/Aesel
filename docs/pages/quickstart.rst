.. _quickstart:

Getting Started with Aesel
==========================

Installing Aesel
----------------

Make sure that you have either :ref:`installed Aesel<install>`, or have access
to an existing Aesel Cloud before continuing.

Interacting with Aesel
----------------------

API
~~~

Aesel's HTTP API will be available at http://localhost:8080.  The UDP API for CLyman
(https://clyman.readthedocs.io/en/v2/pages/Events_API.html) is available at localhost:8762.

Official client libraries are available for the following languages:

* `Python <https://pyaesel.readthedocs.io/en/latest/index.html>`__

User Interface
~~~~~~~~~~~~~~

The following user interfaces will be available by default:

* Aesel Web UI - http://localhost:8080/portal/home
* `Consul <https://www.consul.io/>`__ (Configuration, System Status) - http://localhost:8500/ui
* `Neo4j <https://neo4j.com/>`__ (Database storing Scene information) - http://localhost:7474

I recommend `MongoDB Compass <https://www.mongodb.com/products/compass>__`, Community Edition,
which can connect on localhost:27017.  `Mongo <https://www.mongodb.com/>`__ is the
database which stores object, property, asset, and routing information.

Next
----

:ref:`Continue on to the overview to read more about interacting with Aesel<tests>`
