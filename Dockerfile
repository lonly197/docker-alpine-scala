FROM lonly/docker-alpine-java:oraclejre-8u152

ARG VERSION=2.11.11
ARG BUILD_DATE
ARG VCS_REF

LABEL \
    maintainer="lonly197@qq.com" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.docker.dockerfile="/Dockerfile" \
    org.label-schema.license="Apache License 2.0" \
    org.label-schema.name="lonly/docker-alpine-scala" \
    org.label-schema.url="https://github.com/lonly197" \
    org.label-schema.description="This is a Base and Clean Docker Image for Scala Programming Language." \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/lonly197/docker-alpine-scala" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.vendor="lonly197@qq.com" \
    org.label-schema.version=$VERSION \
    org.label-schema.schema-version="1.0"

# Define Environment
ENV SCALA_HOME=/usr/share/scala \
    PATH=$PATH:${SCALA_HOME}/bin

# Install packages
RUN	set -x \
	## Update apk
	&& apk update \
    ## Install base package
    && apk add --no-cache --upgrade --virtual=build-dependencies ca-certificates wget \
    ## Update ca-cert
    && update-ca-certificates \
    ## Download scala pacakge
    && cd "/tmp" \
    && wget "https://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" \
    && tar -zxvf "scala-${SCALA_VERSION}.tgz" \
    ## Install scala pacakge
    && mkdir "${SCALA_HOME}" \
    && rm "/tmp/scala-${SCALA_VERSION}/bin/"*.bat \
    && mv "/tmp/scala-${SCALA_VERSION}/bin" "/tmp/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" \
    && ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" \
    ## Cleanup
    && apk del build-dependencies \
    && rm -rf /root/.cache \
    && rm -rf *.tgz *.tar *.zip \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/*