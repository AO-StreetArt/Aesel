.. _streaming_design:

Aesel Collaborative Animation Clients
=====================================

Section 1: Abstract
-------------------

This document outlines the design for Collaborative Animation clients
which utilize Aesel.  This is intended as a functional design, and
will not delve too far into technical details as it is intended to be
implemented as an add-on for multiple 3rd party tools, such as Blender
or Maya.

Workflows
~~~~~~~~~

The following workflows will be outlined in the below document:

-  Administration & Project Management
-  Scene Discovery and Management
-  Asset Discovery and Management
-  Object Management & Replication
-  Property Management & Replication
-  Keyframing
-  Animation Graph Handle Replication

Components
~~~~~~~~~~

.. include:: insert/components_insert.rst

Section 2: Vocabulary
---------------------

.. include:: insert/vocab.rst

Section 3: Administration & Project Management
----------------------------------------------

Administration & Project Management (Web UI) includes:

  - Projects, which contain collections of scenes
  - Integrations: CI/render-farms/project-management/email/slack/etc
  - Remotely setup developer nodes

Section 4: Scene Discovery and Management
-----------------------------------------

When discussing Collaborative Animation, a Scene is interpreted to mean
a single 'shot' within the final animation.

Scene Discovery and Management then boils down to managing the shots within the
animation.  The Animation Client will provide several interfaces for managing
these shots:

* List - List view (preferably with thumbnails)
* Detail - Detail view of the scene, to view and update scene details
* Filter - Ability to filter and query for desired scenes in the list view

Section 5: Asset Discovery and Management
-----------------------------------------

Assets can come in many forms, from models to shaders to animations.  Each
asset is stored as a file, meaning that it's filename extension is kept intact
to tell the difference between these asset types.

Users can browser Asset Collections and select assets to import directly
into a scene.  Users can filter and sort the assets, as well as view
thumbnails for each one.

This primarily takes the form of a list view, with the focus on thumbnails
of each asset.  If no scene has been loaded into the Animation Client, then
assets can be imported in order to update them.  Once they have been updated,
they can be re-uploaded as an update to the original, which will update
all corresponding scenes.

Section 6: Object Management & Replication
------------------------------------------

When a Scene is loaded, all of the objects from the scene should be loaded
as well.  From that point forward, objects in a scene are generally managed by
normal user actions within the user interface of the 3rd party animation
software.  Creating a new object, however, is done via a button/hotkey/etc.
Users are expected to spend some time setting up their object assets prior
to saving the object for the first time, when those assets are replicated
to live devices.

Object-level locking is a feature which ensures that animators do not overwrite
each other's changes.  The client will require a successful lock response prior
to updating an object.  Locked object will appear significantly visually
distinct in the viewport, and will require user action (via button, hotkey, etc)
to release the locks.

Object Replication
~~~~~~~~~~~~~~~~~~

Users listen via UDP for updates to objects in real-time after registering to a
scene.  Users can also choose to have updates sent periodically of all locked
objects in the scene.  In this way, multiple users can work on multiple objects,
within the same scene, all at the same time.

In addition to processing updates, clients are also expected to process object
creation and delete messages.  In each case, additional asset downloads may be
required.

Section 7: Property Management & Replication
--------------------------------------------

Properties are utilized to store a variety of non-object related values, which
are somewhat dependent on the system in question.  Properties can also belong
to objects, and can model anything from shape keys and drivers to rig elements.

Properties are stored as one, two, or three double values, and are replicated
in the same fashion as objects, but generally do not require an asset download.

Section 8: Keyframing
---------------------

Keyframes in animation software are critical points within a shot, from which
the rest of the animation is derived.  Clients will store a base Object with
a keyframe equal to -100, and all operations will default to this until a
keyframe is entered.  Upon creating each keyframe for an object, a new
entry is made with a reference to the parent, and a new keyframe value.  For
each keyframe, a new transformation matrix can be stored.

In addition to Objects, Keyframes can also be applied to Properties.

Section 9: Animation Graph Handle Replication
---------------------------------------------

Animation Graph Handles are frequently used in animation software to fine-tune
animations.  Where keyframes set the major points of an animation graph over
time, the handles set the type of curve and gradiant between points.  These
are replicated with projects by default, but this option can be turned off.

Turning off Animation Graph Handle replication does result in a performance
boost, but you should only turn it off if you're sure you don't need it.
