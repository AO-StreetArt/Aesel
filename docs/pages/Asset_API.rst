Asset Creation/Update
~~~~~~~~~~~~~~~~~~~~~

When a device needs to create or update an asset, the Creation/Update
API is available. When calling the API to create a new Asset, either an
Object ID or Scene ID must be specified.

+----------+--------------------------------+
| Method   | Path                           |
+----------+--------------------------------+
| POST     | *<base\_url>*/v1/asset/:key/   |
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
