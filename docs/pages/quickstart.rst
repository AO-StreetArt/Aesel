.. _quickstart:

Getting Started with Aesel
==========================

Installing Aesel
----------------

Make sure that you have either :ref:`installed Aesel<install>`, or have access
to an existing Aesel Cloud before continuing.

Interacting with Aesel
----------------------

User Interface
~~~~~~~~~~~~~~

The Aesel user interface will be available in a development environment
(if you are accessing a remote environment, then replace 'localhost:8080' with
your Aesel address):

* Aesel Web UI - http://localhost:8080/portal/home

If you are accessing a secure environment, then you can access the web UI at:

* Aesel Web UI - https://aesel-cloud-demo.com/portal/login

with a valid username and password (you can login to the above link with the
username 'demo', and the password 'demo').

API
~~~

If you setup a development environment, then Aesel's HTTP API will be available
at http://localhost:8080.  The `UDP API for CLyman <https://clyman.readthedocs.io/en/v2/pages/Events_API.html>`__
is available at localhost:8762.

If you are connecting to an existing Aesel Cloud, then the HTTP URL will be
provided along with your login information.  You can get a bearer token for use
with the :ref:`Login API<login_api>`.

The UDP host, port, and encryption/decryption information will be provided in
the response of a Device Registration message.

Official client libraries are available for the following languages:

* `Python <https://pyaesel.readthedocs.io/en/latest/index.html>`__

Other languages are encouraged to make use of the HTTP and UDP API's directly.

Client Applications
-------------------

Some popular 3D applications have existing Aesel integrations:

Blender
~~~~~~~

Aesel supports integration with the `Blender <https://www.blender.org/>`__ through
an addon, `BlenderSync <https://blendersync.readthedocs.io/en/latest/>`__.


Next
----

:ref:`Continue on to the overview to read more about interacting with Aesel<overview>`
