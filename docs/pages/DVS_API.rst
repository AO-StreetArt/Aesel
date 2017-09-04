Aesel Rest API
==============

Abstract
--------

This page will provide details on the Restful API for the Aesel
Server. The Aesel Server is designed to facilitate communication between
different Augmented Reality Devices, and this communication will be via
both HTTP and UDP. This document will only discuss the UDP Protocols in
relation to the HTTP API’s which allow devices initial access. The full
UDP API will be discussed in further detail in forthcoming
documentation.

Assumptions
-----------

-  The base URL of the server being exposed will be represented by
   *<base\_url>* within this document.
-  Scenes are identified by a geographical region and a name. Within
   this document, a scene’s region and name will be represented by
   :region and :name, respectively.
-  The root URL for all requests is *<base\_url>*/v1. This will hold
   until v2.0.0 is released, when non-backwards-compatible changes will
   be made. At this time, the version number in the root URL will be
   updated.
-  Security pages will not be documented here, more detailed security
   documentation will be forthcoming.
-  All endpoints produce JSON Responses
-  Query Parameters are optional unless otherwise specified

Device API
----------

A User Device can be anything from a mobile phone to a gaming system,
any external system that performs actual rendering for the end-user.
Devices will be the recipients of the (forthcoming) UDP update streams,
and will be the end user making HTTP calls to Aesel.

The actual device object in the API is used to store UDP Connectivity
information. While it is not necessary for the functionality documented
here, it will be necessary in the future once the UDP update streams are
implemented.

.. include:: Device_API.rst

Scene API
---------

A Scene is a group of Objects associated to a particular Latitude and
Longitude. This API exposes CRUD and Query operations for Scenes.

.. include:: Scene_API.rst

Scene Registration API
----------------------

Devices need to register/de-register to scenes as they move around in
the world, and Aesel uses this information to determine what object
updates to stream out to that device. This API allows for registration,
de-registration, and synchronization of devices to scenes.

.. include:: Scene_Registration_API.rst

Object API
----------

An Object is represented by a transformation matrix representing it’s
position in 3-space, as well as a collection of Assets (Mesh files,
Texture files, Shader scripts, etc.). Objects are meant to be interacted
with by individual devices, and these changes will be streamed to either
devices via the forthcoming UDP API. This API exposes CRUD and Query
operations for Objects.

.. include:: Object_API.rst

Asset API
---------

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

.. include:: Asset_API.rst
