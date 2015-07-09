#
# Nasqueron  - Phabricator image
#

FROM node
MAINTAINER Sébastien Santoro aka Dereckson <dereckson+nasqueron-docker@espace-win.org>

RUN cd /opt && \
    git clone https://github.com/phacility/libphutil.git && \
    git clone https://github.com/phacility/phabricator.git && \
    cd phabricator/support/aphlict/server/ && \
    npm install ws

EXPOSE 22280 22281

WORKDIR /opt/phabricator/support/aphlict/server
CMD [ "node", "aphlict_server.js", "--admin-host=0.0.0.0" ]


