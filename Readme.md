# bashninja-dockers/docker-sopel

Sopel is a simple, lightweight, open source, easy-to-use IRC Utility bot, written in Python. It's designed to be easy to use, run and extend.

## Usage

```
docker pull bashninja/docker-sopel
docker run --name=sopel \
-v <path to data>:/config \
-e PGID=<gid> -e PUID=<uid> \
-e TZ=<timezone> bashninja/docker-sopel
```

## Parameters

`The parameters are split into two halves, separated by a colon, the left hand side representing the host and the right the container side. 

* `-v /config` - Where sopel should store config files
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` for timezone EG. Europe/London
