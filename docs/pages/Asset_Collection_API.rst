.. _collection_api:

Asset Collection API
====================

An Asset Collection is a grouping of Assets.  Collections are generally used
for organizational purposes, to simplify browsing and searching of large
asset libraries.

Collections are associated to Assets through Relationships, allowing
Collections to stay up to date with the latest versions of each Asset.

When authentication is active, collections are associated to the user that
creates them and can be public or private.  Users can only interact with
collections that are either public, or that they own.

Asset Collection Creation
~~~~~~~~~~~~~~~~~~~~~~~~~

.. http:post:: /v1/collection

   Create a new Asset Collection.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/collection/collection_create.rst

Asset Collection Retrieval
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. http:get:: /v1/collection/{key}

   Get a Collection by ID.

   :statuscode 200: Success

.. include:: _examples/collection/collection_get.rst

Asset Collection Batch Retrieval
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. http:post:: /v1/bulk/collection

   Get Asset Collections by IDs in bulk.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/collection/collection_get_bulk.rst

Asset Collection Update
~~~~~~~~~~~~~~~~~~~~~~~

.. http:post:: /v1/collection/{key}

   Create a new Asset Collection.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/collection/collection_update.rst

Asset Collection Query
~~~~~~~~~~~~~~~~~~~~~~

.. http:get:: /v1/collection

   Query for Collections by attribute.

   :statuscode 200: Success

.. include:: _examples/collection/collection_query.rst

Asset Collection Delete
~~~~~~~~~~~~~~~~~~~~~~~

.. http:delete:: /v1/collection/{key}

   Delete a Collection by ID.

   :statuscode 200: Success

.. include:: _examples/collection/collection_delete.rst
