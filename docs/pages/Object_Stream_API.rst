Object Update
~~~~~~~~~~~~~

This API exposure is used to update an existing object, and trigger
change streams to all subscribed devices.  Once devices are rendering
based on the objects in a scene, this is the only method that should be
used to update the transforms of that object.

The standard API should still be used to update other elements of the object,
for example type or assets.

+----------+-----------------------------------------------------+
| Method   | Path                                                |
+----------+-----------------------------------------------------+
| POST     | *<base\_url>*/v1/object/:obj_key                    |
+----------+-----------------------------------------------------+

Post Data
^^^^^^^^^

-  JSON Format
-  Includes only transformation elements
-  Example:

{

“translation”: [0, 0, 1],

“rotation\_euler”: [0, 1, 0, 0],

“scale”: [1, 1, 2]

}

.. include:: _examples/object_hsupdate.rst
