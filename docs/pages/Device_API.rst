User Device API
---------------

A User Device is a single device which is performing rendering for a
viewer. This device could be anything from a mobile phone, to a pair of
glasses, to a gaming console.

DeviceDevice Creation/Update
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Create or Update Device information.

+----------+--------------------------------+
| Method   | Path                           |
+----------+--------------------------------+
| POST     | *<base\_url>*/v1/device/:key   |
+----------+--------------------------------+

Post Data
^^^^^^^^^

-  JSON Format
-  Includes UDP connectivity information for the device
-  Example:

{

“host”:”localhost”,

“service”: “aesel”,

“port”:12345

}

Sample Request
^^^^^^^^^^^^^^

\`$ curl -H “Content-Type: application/json” -X POST -d ‘DATA\_STRING’
`http://aesel-test/v1/ <http://aesel-test/v1/device/jklmnop/>`__\ `device/jklmnop/ <http://aesel-test/v1/device/jklmnop/>`__\ \`

Sample Response
^^^^^^^^^^^^^^^

{“num\_records”:1,”devices”:[{“key”:”jklmnop”}]}

Device Retrieval
~~~~~~~~~~~~~~~~

Retrieve device information.

+----------+--------------------------------+
| Method   | Path                           |
+----------+--------------------------------+
| GET      | *<base\_url>*/v1/device/:key   |
+----------+--------------------------------+

Sample Request
^^^^^^^^^^^^^^

\`$ curl -X GET
`http://aesel-test/v1/ <http://aesel-test/v1/device/jklmnop/>`__\ `device/jklmnop/ <http://aesel-test/v1/device/jklmnop/>`__\ \`

Sample Response
^^^^^^^^^^^^^^^

{“num\_records”:1,”devices”:[

{

“host”:”localhost”,

“service”: “aesel”,

“port”:12345

}

]}

Device Deletion
~~~~~~~~~~~~~~~

Delete a device.

+----------+--------------------------------+
| Method   | Path                           |
+----------+--------------------------------+
| DELETE   | *<base\_url>*/v1/device/:key   |
+----------+--------------------------------+

Sample Request
^^^^^^^^^^^^^^

\`$ curl -X DELETE
`http://aesel-test/v1/ <http://aesel-test/v1/device/jklmnop/>`__\ `device/jklmnop/ <http://aesel-test/v1/device/jklmnop/>`__\ \`

Sample Response
^^^^^^^^^^^^^^^

No JSON Response, only HTTP Success/Error Code
