.. _relationship_api:

Asset Relationship API
======================

An Asset Relationship is a link between an asset and any other data entity which is
identifiable by a unique ID.  Each relationship contains an Asset ID and a Related ID,
as well as a Relationship Type.  These are used to model relationships with both
external sources (such as Scenes and Objects), and between assets (such as
having one Asset be the thumbnail of another).

Asset Relationship Save
~~~~~~~~~~~~~~~~~~~~~~~

.. http:put:: /v1/relationship

   Create or update an Asset Relationship.

   :query string asset: Optional.  If this and 'type' are specified, then this will overwrite matching Relationships.
   :query string related: Optional.  If this and 'type' are specified, then this will overwrite matching Relationships.
   :query string type: Optional.  Must appear with 'related' or 'asset'.  The type of Relationship to override.
   :reqheader Content-Type: application/json
   :statuscode 200: Success

.. include:: _examples/asset/asset_relationship_save.rst

Asset Relationship Deletion
~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. http:delete:: /v1/relationship

   Delete an Asset Relationship.

   :query string asset: Required.  The Asset ID of the Relationship to delete.
   :query string related: Required.  The Related ID of the Relationship to delete.
   :query string type: Required.  The type of Relationship to delete.
   :statuscode 200: Success

.. include:: _examples/asset/asset_relationship_delete.rst

Asset Relationship Query
~~~~~~~~~~~~~~~~~~~~~~~~

.. http:get:: /v1/relationship

   Find Asset Relationships based on one or more attributes.

   :query string asset: Required.  The Asset ID of the Relationship to find.
   :query string related: Required.  The Related ID of the Relationship to find.
   :query string type: Required.  The type of Relationship to find.
   :statuscode 200: Success

.. include:: _examples/asset/asset_relationship_query.rst
