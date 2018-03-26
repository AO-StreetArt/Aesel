Asset Creation
~~~~~~~~~~~~~~

When a device needs to create an asset, the Creation
API is available.

The file being stored should be sent in the form-data of the body, with multi-part
form sending supported.

The body of the response will be a string of the key from which the asset can be
retrieved using the GET request below.

+----------+--------------------------------+
| Method   | Path                           |
+----------+--------------------------------+
| POST     | *<base\_url>*/v1/asset/        |
+----------+--------------------------------+

Parameters
^^^^^^^^^^

-  scene (string) – Optional. The Scene ID to associate the asset to.
-  object (string) – Optional. The Object ID to associate the asset to.
-  content-type (string) – Optional. The Content Type to save to the DB.
-  file-type (string) – Optional. The File type of the document.

Post Data
^^^^^^^^^

-  Asset File to be stored

.. include:: _examples/asset_create.rst

Asset Update
~~~~~~~~~~~~

When a device needs to update an asset, the Asset Update API can create
a new version of the file, with a new unique key, and update the scene
so that the latest version is downloaded by other devices.

Please note that multiple devices each downloading an asset, making
separate updates, and expecting Aesel to merge the changes together
is not supported.

+----------+--------------------------------+
| Method   | Path                           |
+----------+--------------------------------+
| POST     | *<base\_url>*/v1/asset/:key/   |
+----------+--------------------------------+

Parameters
^^^^^^^^^^

-  scene (string) – Optional. The name of the scene the asset is associated to.
-  object (string) – Optional. The name of the Object the asset is associated to.
-  content-type (string) – Optional. The Content Type to save to the DB.
-  file-type (string) – Optional. The File type of the document.

Post Data
^^^^^^^^^

-  Asset File to be stored

.. include:: _examples/asset_update.rst

Asset Retrieve
~~~~~~~~~~~~~~

The retrieval API allows a device to retrieve one asset.

+----------+--------------------------------+
| Method   | Path                           |
+----------+--------------------------------+
| GET      | *<base\_url>*/v1/asset/:key/   |
+----------+--------------------------------+

.. include:: _examples/asset_get.rst

Asset Delete
~~~~~~~~~~~~

The delete API allows a device to remove one or more object assets.

+----------+--------------------------------+
| Method   | Path                           |
+----------+--------------------------------+
| DELETE   | *<base\_url>*/v1/asset/:key/   |
+----------+--------------------------------+

Parameters
^^^^^^^^^^

-  scene (string) – Optional. The Scene ID to associate the asset to.
-  object (string) – Optional. The Object ID to associate the asset to.

.. include:: _examples/asset_delete.rst

Asset History
~~~~~~~~~~~~~

The asset history API allows you to view a history of all versions of an asset.

The array 'assetIds' will contain a list of all the versions of this asset, with
the most recent listed first and the original ID listed last.

+----------+-------------------------------------------------+
| Method   | Path                                            |
+----------+-------------------------------------------------+
| GET      | *<base\_url>*/v1/asset-history/:key/            |
+----------+-------------------------------------------------+

.. include:: _examples/asset_history.rst
