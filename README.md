# docker-netbeans

Docker-based Firefox using X11 socket to display Web GUI

## Requirements

```sh
docker run -ti --rm \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v `pwd`/.netbeans-docker:/home/developer/.netbeans \
           -v `pwd`:/workspace \
           openkbs/firefox
```

## Help! I started the container but I don't see the NetBeans screen

You might have an issue with the X11 socket permissions since the default user
used by the base image has an user and group ids set to `1000`, in that case
you can run either create your own base image with the appropriate ids or run
`xhost +` on your machine and try again.

## Reference
Running GUI apps with Docker [http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/]

