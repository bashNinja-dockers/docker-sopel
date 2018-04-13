FROM lsiobase/alpine.python:3.7

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Mike Weaver"

RUN \
echo "**** install packages ****" && \
apk add --no-cache \
    enchant && \
echo "**** install temp packages ****" && \
apk add --virtual _build-packages_ \ 
	alpine-sdk \
    python-dev && \
echo "**** install pip packages ****" && \
pip install --no-cache-dir -U \
	git+https://github.com/sopel-irc/sopel.git && \
echo "**** cleanup ****" && \
apk del --purge _build-packages_ && \
rm -rf /var/cache/apk/* && \
rm -rf \
	/root/.cache \
	/tmp/*

# add local files
COPY root/ /

# ports and volumes
VOLUME /config /comics /downloads
EXPOSE 8090