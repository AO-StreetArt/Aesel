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

   Create a new User.  Please note that only administrator users can access this endpoint.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/user/user_create.rst

User Retrieval
~~~~~~~~~~~~~~

.. http:get:: /v1/users/(key)

   Get a User by ID.

   :statuscode 200: Success

.. include:: _examples/user/user_get.rst

User Update
~~~~~~~~~~~

.. http:put:: /v1/users/(key)

   Update an existing User's basic (String or number) attributes.
   This endpoint cannot update list attributes, including favorite
   projects and favorite scenes.  These can be updated by the
   respective HTTP endpoints.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/user/user_update.rst

Add Favorite Project
~~~~~~~~~~~~~~~~~~~~

.. http:put:: /v1/users/(key)/projects/(projectKey)

   Atomically add a Project Key to the favoriteProjects list of the user.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/user/user_add_fav_project.rst

Remove Favorite Project
~~~~~~~~~~~~~~~~~~~~~~~

.. http:delete:: /v1/users/(key)/projects/(projectKey)

   Atomically remove a Project Key from the favoriteProjects list of the user.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/user/user_remove_fav_project.rst

Add Favorite Scene
~~~~~~~~~~~~~~~~~~

.. http:put:: /v1/users/(key)/scenes/(sceneKey)

   Atomically add a Scene Key to the favoriteScenes list of the user.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/user/user_add_fav_scene.rst

Remove Favorite Scene
~~~~~~~~~~~~~~~~~~~~~

.. http:delete:: /v1/users/(key)/scenes/(sceneKey)

   Atomically remove a Scene Key from the favoriteScenes list of the user.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/user/user_remove_fav_scene.rst

User Query
~~~~~~~~~~

.. http:get:: /v1/users/

   Query for users by attribute.

   :statuscode 200: Success

.. include:: _examples/user/user_query.rst

User Delete
~~~~~~~~~~~

.. http:delete:: /v1/users/(key)

   Delete a user by ID.

   :statuscode 200: Success

.. include:: _examples/user/user_delete.rst
