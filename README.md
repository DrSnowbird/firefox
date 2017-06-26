# docker-netbeans

Docker-based Firefox using X11 socket to display Web GUI

## Run (using default uid:gid as 1000:1000)

```sh
docker run -ti --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v `pwd`/.netbeans-docker:/home/developer/.netbeans \
    -v `pwd`:/workspace \
    openkbs/firefox
```

## Run (using different uid:gid)

You might have an issue with the X11 socket permissions since the default user
used by the base image has an user and group ids set to `1000`.
To change, you can provide environment variables (USER_ID, GROUP_ID) when run docker:
```
docker run -ti --rm \
    -e DISPLAY=$DISPLAY \
    -e USER_ID=1001 \
    -e GROUP_ID=1001 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v `pwd`/.netbeans-docker:/home/developer/.netbeans \
    -v `pwd`:/workspace \
    openkbs/firefox
```

## Reference
Running GUI apps with Docker [http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/]

