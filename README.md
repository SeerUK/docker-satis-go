Docker Satis Go
===============

Docker image packaging for [satis-go (benschw)][1], image based on the official Go image.

Volumes
-------

* **/go/src/github.com/benschw/satis-go/data:** Where the Satis data is stored. Use this volume to persist your Satis data.

* **/go/src/github.com/benschw/satis-go/config-local.yml:** The config file, details can be found in [the satis-go repository][1]. By default it is set up to listen on port 8080 (this port is exposed).

Notes
-----

* This image is designed to be run with the user as "satis", UID 1000. If you are mounting files into the container that are owned by a user other than the user with UID 1000 on your host system, then you may run into problems.

[1]: https://github.com/benschw/satis-go
