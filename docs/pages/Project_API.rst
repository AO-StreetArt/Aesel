.. _api:

Project API
===========

A Project contains groups of scenes, as well as Asset Collections.  It is
primarily used for organization, and helps manage a full-scale animation
production.

Project Creation
~~~~~~~~~~~~~~~~

.. http:post:: /v1/project

   Create a new Project.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/project/project_create.rst

Project Retrieval
~~~~~~~~~~~~~~~~~

.. http:get:: /v1/project/{key}

   Get a project by ID.

   :statuscode 200: Success

.. include:: _examples/project/project_get.rst

Project Update
~~~~~~~~~~~~~~

.. http:post:: /v1/project/{key}

   Create a new Project.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/project/project_update.rst

Project Query
~~~~~~~~~~~~~

.. http:get:: /v1/project

   Query for projects by attribute.

   :statuscode 200: Success

.. include:: _examples/project/project_query.rst

Project Delete
~~~~~~~~~~~~~~

.. http:delete:: /v1/project/{key}

   Delete a project by ID.

   :statuscode 200: Success

.. include:: _examples/project/project_delete.rst
