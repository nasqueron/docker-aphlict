Aphlict server for Phabricator
==============================

One Aphlict server could serve one or several instances of Phabricator.

Run directly on HTTP
--------------------

1. Pull the image: `docker pull nasqueron/aphlict`
2. Run the container: `docker -dt -p 22280:22280 -p 22281:22281 nasqueron/aphlict aphlict`
3. Configure your Phabricator instance at http://phabricator.domain.tld/config/group/notification/

When you configure your instance, three parameters are necessary:

* **notification.enabled:** true (Enable Real-Time Notifications)
* **notification.client-uri:** http://<ip or host>:22280/
* **notification.server-uri:** http://<ip or host>:22281/


TLS termination
---------------

Steps 1 and 2 as above.

3. Follow the instructions of https://secure.phabricator.com/book/phabricator/article/notifications/#advanced-usage to configure your nginx. Note you can directly use proxy_pass http://localhost:22280/ and discard the upstream block.
4. Configure your Phabricator instance at https://phabricator.domain.tld/config/group/notification/

When you configure your intance, three parameters are necessary, but only *client-uri* changes from the HTTP config:

* notification.client-uri: https://phabricator.domain.tld/ws/

The other two remains the same:

* notification.server-uri: http://<ip or host>:22281/ * 
* notification.enabled: true (Enable Real-Time Notifications)

Note
----

You won't be able to access log or PID file, excepted if you add volumes
and share them with your Phabricator instance (`-v ... --volumes-from=aphlict`).
