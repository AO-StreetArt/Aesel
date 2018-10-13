.. _auth:

Authenticating with Aesel
============================

:ref:`Go Home <index>`

Aesel utilizes `Auth0 <https://auth0.com>`__ for it's authentication
flows.  This provides a number of integrations, and I suggest referring to their
latest documentation to obtain a better understanding of how this all functions.

Aesel provides JWT authentication with Spring Security, so is capable of
authenticating from User Databases, social log-ins, etc.  To test out authentication,
you can visit http://aesel-address:8080/login, making sure to replace 'aesel-address'
with the address of your instance.

You can follow `this guide <https://auth0.com/docs/quickstart/webapp/java-spring-security-mvc/01-login>`__
to setup your Auth0 account to integrate with Aesel correctly.  The configuration
properties required can be set in application.properties or a separate file called 'auth0.properties'.
