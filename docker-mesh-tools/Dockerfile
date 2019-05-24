FROM gentics/mesh:0.33.0
LABEL maintainer="j.schueth@gentics.com"

USER root
WORKDIR /root

RUN apk add --no-cache curl tar bash procps jq nodejs unzip openjdk8
RUN npm install mesh-cli -g

USER mesh
WORKDIR /mesh

ENV ODB_VERSION 3.0.18

RUN curl -o orientdb.zip https://s3.us-east-2.amazonaws.com/orientdb3/releases/${ODB_VERSION}/orientdb-${ODB_VERSION}.zip && unzip orientdb.zip && rm orientdb.zip
ENV PATH="/mesh/orientdb-${ODB_VERSION}/bin:/mesh/orientdb-community-importers-${ODB_VERSION}/bin:${PATH}"

CMD [ "sleep", "3600"]
