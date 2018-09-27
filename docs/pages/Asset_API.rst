Asset API
=========

An asset is a resource that each device will need in order to accurately
depict objects around it. This can vary, from an .obj file, containing
mesh information, to a .glsl file, containing shader information, to a
.png or .jpg file containing an image. Assets can either be associated
to a Scene or an Object.

A Scene Asset is a file that devices may need to utilize in order to
synchronize views of scenes with other devices, such as a photograph of
a specified object or marker. It can also include map/level mesh and
shader information, for use with VR/traditional video games. This API
allows for the storage and retrieval of such files.

An Object Asset is a file that is used to construct an Object. Entire
collections of assets are expected to be downloaded for each object, and
so registering to a scene is expected to incur a large set of downloads
to collect all of the assets within that scene.

Asset Creation
~~~~~~~~~~~~~~

.. http:post:: /v1/asset

   Create an asset.  The file being stored should be sent in the form-data of the body, with multi-part
   form sending supported.  The body of the response will be a string of the key from which the asset can be
   retrieved using the GET request below.

   :query string scene: Scene ID to associate the asset to
   :query string object: Object ID to associate the asset to
   :query string content-type: Content Type of the asset
   :query string file-type: File Type of the asset
   :form file: The file to store

.. include:: _examples/asset/asset_create.rst

Asset Update
~~~~~~~~~~~~

.. http:post:: /v1/asset/(key)

   When a device needs to update an asset, the Asset Update API can create
   a new version of the file, with a new unique key, and update the scene
   so that the latest version is downloaded by other devices.

   Please note that multiple devices each downloading an asset, making
   separate updates, and expecting Aesel to merge the changes together
   is not supported.

   :query string scene: Scene ID to associate the asset to
   :query string object: Object ID to associate the asset to
   :query string content-type: Content Type of the asset
   :query string file-type: File Type of the asset
   :form file: The file to store

.. include:: _examples/asset/asset_update.rst

Asset Retrieve
~~~~~~~~~~~~~~

.. http:get:: /v1/asset/(key)

   The retrieval API allows a device to retrieve one asset, which will be returned
   in the body of the response.

.. include:: _examples/asset/asset_get.rst

Asset Delete
~~~~~~~~~~~~

.. http:delete:: /v1/asset/(key)

   The delete API allows a device to remove one object asset.

   :query string scene: Scene ID to disassociate the asset from
   :query string object: Object ID to disassociate the asset from

.. include:: _examples/asset/asset_delete.rst

Asset History
~~~~~~~~~~~~~

.. http:get:: /v1/asset-history/(key)

   The asset history API allows you to view a history of all versions of an asset.

   The array 'assetIds' will contain a list of all the versions of this asset, with
   the most recent listed first and the original ID listed last.

.. include:: _examples/asset/asset_history.rst
