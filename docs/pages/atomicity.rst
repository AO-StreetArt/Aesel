.. _atomicity:

Transactions in Aesel
=====================

An Aesel transaction (ie. the set of actions triggered by the receipt of an external message)
is atomic, with the exception of Asset Updates.  The general assumption is this:

* Scenes & Objects have active atomic enforcement guaranteed, and are safe for multiple devices to interact with simultaneously
* Assets are viewed as setup, and multiple devices are not expected to be updating assets at the same time.  Asset reads are safe for multiple devices to execute simultaneously.

Object Locking
--------------

when utilizing Object Locking, the first device that requests the lock will be awarded it, with any other
competing requests denied.  Any lock request or update against the object will fail unless it is executed
by the owner (ie. the 'owner' field of the object matches that stored in Aesel), until an unlock request is received from the owner.

It is still possible for other devices to query or get the object, and retrieve the owner ID.

Object Change Streams
---------------------

In the Object Change Stream API, a significant change occurs in the API.  We still guarantee atomic transactions,
but the results of any event may fail to reach any given device, or an event may fail to transfer to the server
altogether.  For this reason, users are generally expected to send a large volume of these messages in most cases,
continually informing Aesel of the current values of the object or property in question.
