Aphlict server for Phabricator
==============================

One Aphlict server could serve one or several instances of Phabricator.

Run directly on HTTP
--------------------

1. Pull the image: `docker pull nasqueron/aphlict`
2. Run the container: `docker run -dt -p 22280:22280 -p 22281:22281 nasqueron/aphlict`
3. Configure your Phabricator instance at http://phabricator.domain.tld/config/edit/notification.servers

When you configure your instance, use the following template:

```lang=json
[
  {
    "type": "client",
    "host": "aphlict.yourdomain.tld",
    "port": 22280,
    "protocol": "http"
  },
  {
    "type": "admin",
    "host": "aphlict.yourdomain.tld",
    "port": 22281,
    "protocol": "http"
  }
]
```

TLS termination
---------------

Add a certificate to your container, replace the protocol
http by https in Phabricator config.

Edit /opt/phabricator/conf/aphlict/aphlict.custom.json in your
container, so ssl.key & ssl.cert certificates have the relevant paths.

Note
----

You can get the server log using `docker logs <your container name>`.

To check the status of the server,
use http://phabricator.domain.tld/config/cluster/notifications/
