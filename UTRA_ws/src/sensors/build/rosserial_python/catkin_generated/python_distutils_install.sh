#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/brian/UTRA_ws/sensors/src/rosserial_python"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/brian/UTRA_ws/sensors/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/brian/UTRA_ws/sensors/install/lib/python2.7/dist-packages:/home/brian/UTRA_ws/sensors/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/brian/UTRA_ws/sensors/build" \
    "/usr/bin/python" \
    "/home/brian/UTRA_ws/sensors/src/rosserial_python/setup.py" \
    build --build-base "/home/brian/UTRA_ws/sensors/build/rosserial_python" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/brian/UTRA_ws/sensors/install" --install-scripts="/home/brian/UTRA_ws/sensors/install/bin"
