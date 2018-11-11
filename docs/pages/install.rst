.. _install:

Installing Aesel
================

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
