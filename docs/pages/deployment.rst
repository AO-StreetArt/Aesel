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

Deployment Guides
-----------------
* :ref:`Development Environment<install>`
* :ref:`Secure, Single-Server Environment<demo_install>`

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

Aesel has several layers of security:

Transactions
~~~~~~~~~~~~

Transactional Security utilizes TLS (HTTPS) for encryption.

The following commands can be used to generate a self-signed SSL cert, along with
a client cert.  This can be used to test the secured transactional setup.

`openssl req -x509 -newkey rsa:4096 -keyout caKey.key -out caCert.pem -days 365`

`openssl genrsa -out clientKey.key 2048`

`openssl req -new -key clientKey.key -out clientCert.csr`

`openssl x509 -req -in clientCert.csr -CA caCert.pem -CAkey caKey.key -CAcreateserial -out MyClient1.crt -days 1024 -sha256`

Aesel utilizes `Auth0 <https://auth0.com>`__ for it's front-end authentication
flows.  This provides a number of integrations, and I suggest referring to their
latest documentation to obtain a better understanding of how this all functions.

Adrestia provides JWT authentication with Spring Security, so is capable of
authenticating from User Databases, social log-ins, etc.  To test out authentication,
you can visit http://adrestia-address:8080/login, making sure to replace 'adrestia-address'
with the address of your instance.

You can follow `this guide <https://auth0.com/docs/quickstart/webapp/java-spring-security-mvc/01-login>`__
to setup your Auth0 account to integrate with Adrestia correctly.

Events
~~~~~~

UDP Events utilize AES-256-cbc encryption, with the key, password, salt, and IV
set in the application configuration.  AES-256 bit keys can be generated with
the below command:

`openssl enc -aes-256-cbc -k secret -P -md sha1`

Where 'secret' is a password for generating the key.

Keep in mind that AES encryption is symmetrical, meaning that the encryption keys
must be distributed to the clients in order to encrypt traffic between them
and Crazy Ivan.  The key and salt are delivered to end user devices after a
registration transaction, which is both authenticated and encrypted.

Configuration
~~~~~~~~~~~~~

Secure configuration values should stored in Hashicorp Vault, with full encryption
and authentication enabled.  Connecting and authenticating to any service requires
accessing at least one secure property in Vault, ensuring that any malicious entities
must go through Vault to get into any system in the network.

This does mean that your Vault instance should be carefully guarded: it has all
of the keys to the castle.  However, it is a system designed specifically to
guard these secrets, so when used properly it is one of the best safeguards
available, along with a healthy dose of common-sense.
