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

Starting a Secure, Single-Node Deployment
-----------------------------------------

This is a great option for Demo environments, or small LAN-based networks which
only need to handle scenes for a few users.

While this is secure, it is not intended for deployment in a cloud
production environment.  The security of this deployment depends on
the security of the underlying server running Aesel.

Download
~~~~~~~~

First, Download the Aesel setup files from https://github.com/AO-StreetArt/Aesel/archive/master.zip.

Unzip the files, and open a terminal/command prompt from the main folder.

Open the aesel.sh file.  This contains the central definitions for the
variables you'll fill out.  First, pay attention to the 'SSL_BASE_DIR' variable.
This sets the base directory where your SSL Certificates are contained, with a
default of '/var/ssl'.


SSL Setup
~~~~~~~~~

Before we go any further, let's go ahead and obtain valid SSL Certificates. The
best way to do this is through Let's Encrypt, you can follow the tutorials
at https://certbot.eff.org/.  Self-Signed Certificates are not supported.
Make sure that you're certificates are registered to the same domain that you
enter into the AESEL_DOMAIN variable.

You may need to copy/convert some of the certs around, below is a tree of the
basic file structure needed in /var/ssl (or whatever you enter for the SSL_BASE_DIR):

|  ~var
|  ~~ssl
|  ~~~trusted
|  ~~~~neo4j
|  ~~~~~ca.crt
|  ~~~neo4j
|  ~~~~server.crt
|  ~~~~server.key
|  ~~~mongo
|  ~~~~mongodb.pem
|  ~~~clyman
|  ~~~~server.crt
|  ~~~~server.key
|  ~~~ivan
|  ~~~~server.crt
|  ~~~~server.key
|  ~~~adrestia
|  ~~~~certificate.p12
|  ~~~kelona
|  ~~~~certificate.p12
|  ~~~projects
|  ~~~~certificate.p12

AES Configuration
~~~~~~~~~~~~~~~~~

AES Information is set in the aesel.sh script, and can be generated with:

`openssl enc -aes-256-cbc -k secret -P -md sha1`

Where 'secret' is a password for generating the key.

Auth0 Setup
~~~~~~~~~~~

Add your Auth0 information into the deployment/full/config/adrestia/auth0.properties
file.  You can follow `this guide <https://auth0.com/docs/quickstart/webapp/java-spring-security-mvc/01-login>`__
to setup your Auth0 account to integrate with Adrestia correctly.

Start Database Layer
~~~~~~~~~~~~~~~~~~~~

To start the Aesel DB Layer, run the below command:

`./aesel.sh db`

Then, you can go to localhost:7474/browser in a web browser, and update the Neo4j
login information.

Authentication Configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Open back up the aesel.sh file, and start by entering the Neo4j login into the
NEO4J_UN and NEO4J_PW variables.  Then, you can update the variables for:

* KELONA_UN
* KELONA_PW
* ADRESTIA_UN
* ADRESTIA_PW
* PROJECTS_UN
* PROJECTS_PW
* IVAN_UN
* IVAN_PW
* CLYMAN_UN
* CLYMAN_PW
* MONGO_INIT_USER
* MONGO_INIT_PW

Start Scene Cluster
~~~~~~~~~~~~~~~~~~~

Starting a Scene Cluster (Crazy Ivan and CLyman), can be done with the below command:

`./aesel.sh cluster`

Start Stateless Services
~~~~~~~~~~~~~~~~~~~~~~~~

Core, Stateless Services (Adrestia, Kelona, Projects), can be started with:

`./aesel.sh core`

Login
~~~~~

Now you can open your web browser and navigate to https://localhost:8080/portal/home.
Login with an account you setup on your Auth0 dashboard.
