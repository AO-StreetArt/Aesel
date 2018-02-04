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

Post Data
^^^^^^^^^

-  Asset File to be stored

.. include:: _examples/asset_create.rst

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

.. include:: _examples/asset_delete.rst
