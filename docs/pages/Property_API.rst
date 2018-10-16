.. _property_api:

Property API
============

A Property is a set of between 1 and 4 double values, which may
or not be associated to properties.  Properties can also support frames and/or
timestamps, just like properties, but cannot be locked and have no transformations.

Properties are meant to be interacted with by individual devices,
and these changes will be streamed to other devices via the Events API.
In addition, Create and Update messages sent to the HTTP API are
converted to events and streamed out to registered devices.

Property Creation
~~~~~~~~~~~~~~~~~

.. http:post:: /v1/scene/(key)/property/

   Create a new property.

   :reqheader Content-Type: Application/json
   :statuscode 200: Success

.. include:: _examples/property/property_create.rst

Property Update
~~~~~~~~~~~~~~~

.. http:post:: /v1/scene/(key)/property/{property_key}

   Update an existing property.

   :reqheader Content-Type: Application/json
   :statuscode 200: Success
   :statuscode 404: Property Not Found

.. include:: _examples/property/property_update.rst

Property Retrieval
~~~~~~~~~~~~~~~~~~

.. http:get:: /v1/scene/(key)/property/(property_key)

   Get property details in JSON Format.

   :statuscode 200: Success
   :statuscode 404: Property Not Found

.. include:: _examples/property/property_get.rst

Property Deletion
~~~~~~~~~~~~~~~~~

.. http:delete:: /v1/scene/(key)/property/(property_key)

   Delete an property.

   :statuscode 200: Success
   :statuscode 404: Property Not Found

.. include:: _examples/property/property_delete.rst

Property Query
~~~~~~~~~~~~~~

.. http:get:: /v1/scene/(key)/property/query

   Query for properties which match the input JSON.  This will only
   return as many records as specified in the field 'num_records'.

   :statuscode 200: Success

.. include:: _examples/property/property_query.rst
