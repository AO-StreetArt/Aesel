.. _api:

Project API
===========

A Project contains groups of scenes, as well as Asset Collections.  It is
primarily used for organization, and helps manage a full-scale animation
production.

When authentication is active, projects are associated to the user that
creates them and can be public or private.  Users can only interact with
projects that are either public, or that they own.

Project Creation
~~~~~~~~~~~~~~~~

.. http:post:: /v1/project

   Create a new Project.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/project/project_create.rst

Project Retrieval
~~~~~~~~~~~~~~~~~

.. http:get:: /v1/project/(key)

   Get a project by ID.

   :statuscode 200: Success

.. include:: _examples/project/project_get.rst

Project Update
~~~~~~~~~~~~~~

.. http:post:: /v1/project/(key)

   Update the basic (String and numeric) attributes of an existing Project.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/project/project_update.rst

Add Scene Group
~~~~~~~~~~~~~~

.. http:post:: /v1/project/(key)/groups

   Create a new Scene Group associated to the specified Project.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/project/add_scene_group.rst

Update Scene Group
~~~~~~~~~~~~~~~~~~

.. http:post:: /v1/project/(key)/groups/{groupName}

   Update the basic attributes (String and numeric) of an existing
   Scene Group associated to the specified Project.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/project/update_scene_group.rst

Add Scene to Scene Group
~~~~~~~~~~~~~~~~~~~~~~~~

.. http:put:: /v1/project/(key)/groups/{groupName}/scenes/{sceneKey}

   Add a Scene by ID to an existing Scene Group, which is associated
   to the specified Project.

   :statuscode 200: Success

.. include:: _examples/project/add_scene_to_group.rst

Remove Scene from Scene Group
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. http:delete:: /v1/project/(key)/groups/{groupName}/scenes/{sceneKey}

   Remove a Scene by ID from an existing Scene Group, which is associated
   to the specified Project.

   :statuscode 200: Success

.. include:: _examples/project/remove_scene_from_group.rst

Remove Scene Group
~~~~~~~~~~~~~~~~~~

.. http:delete:: /v1/project/(key)/groups/{groupName}

   Remove an existing Scene Group from the specified Project.

   :statuscode 200: Success

.. include:: _examples/project/remove_scene_group.rst

Project Query
~~~~~~~~~~~~~

.. http:get:: /v1/project

   Query for projects by attribute.

   :statuscode 200: Success

.. include:: _examples/project/project_query.rst

Project Delete
~~~~~~~~~~~~~~

.. http:delete:: /v1/project/(key)

   Delete a project by ID.

   :statuscode 200: Success

.. include:: _examples/project/project_delete.rst
