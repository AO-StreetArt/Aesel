.. _install:

Installing Aesel
================

System Requirements
-------------------

.. include:: insert/system_reqs.rst

Docker
------

.. include:: insert/docker.rst

Starting a Development Deployment
---------------------------------

This is a great option if you want to play around with the Aesel API's,
integrations, and web browser, without dealing with all of the complexity
that a secure environment brings.

First, Download the Aesel setup files from https://github.com/AO-StreetArt/Aesel/archive/master.zip.

Unzip the files, and open a terminal/command prompt from the main folder.

Run the following commands:

``./aesel.sh dev``

.. admonition:: Note

   Windows users will need to call docker-compose manually, from the
   'deployment/min/compose' folder.  You will need the environment variable
   NETWORK_INTERFACE_ADDRESS set to your IP address for the development cluster
   UDP API to function correctly.

Congratulations, Aesel is now up and running on your computer!  To make sure that everything started
correctly, open up your web browser after about 30 seconds and go to the address
http://localhost:8080/portal/home.

Advanced Deployment Guides
--------------------------
* :ref:`Deploying a Secure, Single-Server Setup <demo_install>`

:ref:`Continue on to the quickstart guide <quickstart>`
