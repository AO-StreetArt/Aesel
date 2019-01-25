Asset API
=========

An asset is a resource that each device will need in order to accurately
depict objects around it. This can vary, from an .obj file, containing
mesh information, to a .glsl file, containing shader information, to a
.png or .jpg file containing an image. Assets can either be associated
to a Scene or an Object, or anything else by Asset Relationships.

A Scene Asset is a file that devices may need to utilize in order to
synchronize views of scenes with other devices, such as a photograph of
a specified object or marker. It can also include map/level mesh and
shader information, for use with VR/traditional video games. This API
allows for the storage and retrieval of such files.

An Object Asset is a file that is used to construct an Object. Entire
collections of assets are expected to be downloaded for each object, and
so registering to a scene is expected to incur a large set of downloads
to collect all of the assets within that scene.

When authentication is active, assets are associated to the user that
creates them and can be public or private.  Users can only interact with
assets that are either public, or that they own.

Asset Creation
~~~~~~~~~~~~~~

.. http:post:: /v1/asset/

   Create a new asset from the File Data in the body of the request.  If the
   'related-id' and 'related-type' are also populated, then an Asset Relationship
   is created as well.

   :query string content-type: Optional.  The content type of the asset (ie. application/json).
   :query string file-type: Optional.  The file type of the asset (ie. json).
   :query string related-id: Optional.  Must appear with 'related-type'.  Used to create a relationship to the specified object.
   :query string related-type: Optional.  Must appear with 'related-id'.  Used the create a relationship of the specified type.
   :query string asset-type: Optional.  Populated into the query-able Asset Metadata.
   :query boolean isPublic: Optional.  Is the asset public or proviate
   :reqheader Content-Type: multipart/*
   :statuscode 200: Success

.. include:: _examples/asset/asset_create.rst

Asset Update
~~~~~~~~~~~~

.. http:post:: /v1/asset/{asset_key}

   Update an existing Asset.  This returns a new key for the asset, and adds
   an entry to the associated Asset History.  This will also update all relationships
   which were associated to the old Asset, and associate them to the new Asset.

   :query string content-type: Optional.  The content type of the asset (ie. application/json).
   :query string file-type: Optional.  The file type of the asset (ie. json).
   :query string asset-type: Optional.  Populated into the query-able Asset Metadata.
   :reqheader Content-Type: multipart/*
   :statuscode 200: Success

.. include:: _examples/asset/asset_update.rst

Asset Retrieval
~~~~~~~~~~~~~~~

.. http:get:: /v1/asset/(asset_key)

   Retrieve an asset by ID.

   :statuscode 200: Success

.. include:: _examples/asset/asset_get.rst

Asset Count
~~~~~~~~~~~

.. http:get:: /v1/asset/count

   Count the total number of assets matching the given query.

   :query string content-type: Optional.  The content type of the asset (ie. application/json).
   :query string file-type: Optional.  The file type of the asset (ie. json).
   :query string asset-type: Optional.  Valid options are 'standard' (for normal assets), and 'thumbnail' for thumbnail assets.
   :statuscode 200: Success

.. include:: _examples/asset/asset_count.rst

Asset Metadata Query
~~~~~~~~~~~~~~~~~~~~

.. http:get:: /v1/asset

   Query Asset Metadata based on various attributes.

   :query string content-type: Optional.  The content type of the asset (ie. application/json).
   :query string file-type: Optional.  The file type of the asset (ie. json).
   :query string asset-type: Optional.  Valid options are 'standard' (for normal assets), and 'thumbnail' for thumbnail assets.
   :query limit: Optional.  The maximum number of records to return.
   :query offset: Optional.  The number of records to skip, enabling pagination with the 'limit' parameter.
   :statuscode 200: Success

.. include:: _examples/asset/asset_query.rst

Asset Metadata Batch Query
~~~~~~~~~~~~~~~~~~~~~~~~~~

.. http:post:: /v1/bulk/asset

   Get Asset Metadata by IDs in bulk.

   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/collection/asset_query_bulk.rst

Asset Deletion
~~~~~~~~~~~~~~

.. http:delete:: /v1/asset/(asset_key)

   Delete an asset.

   :statuscode 200: Success

.. include:: _examples/asset/asset_delete.rst

Asset History Retrieval
~~~~~~~~~~~~~~~~~~~~~~~

.. http:get:: /v1/asset/(asset_key)

   An Asset History is a record of all the versions of a particular asset.

   :statuscode 200: Success

.. include:: _examples/asset/asset_history.rst
