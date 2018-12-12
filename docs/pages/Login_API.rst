.. _login_api:

Login API
=========

Log into Aesel with a valid username and password.

This will return values in the 'Set-Cookie' header, meant for use by browsers,
as well as the 'Authorization' header, meant for use by external applications.

Login
~~~~~

.. http:post:: /v1/login

   Login to Aesel, retrieving the authentication token required for future requests.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/login.rst
