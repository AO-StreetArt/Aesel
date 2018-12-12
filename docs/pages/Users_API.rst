.. _users_api:

Users API
=========

A user is a valid login for a secured application.

Users can also be labelled with 'isAdmin', which marks them
as able to access back-end endpoints not required for
standard users.

User Creation
~~~~~~~~~~~~~

.. http:post:: /v1/users/sign-up

   Create a new User.  Please note that only adminstrator users can access this endpoint.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/user/user_create.rst
