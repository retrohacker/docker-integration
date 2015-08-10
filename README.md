# docker test server

Builds a Docker Jenkins Server with Docker baked in (using dind).

# Usage

> To install the jenkins plugins, run `populate_state.sh` before building the docker image. State can be loaded into the image as a volume.

```sh
$ docker build -t jenkins .
$ docker run --privileged -it -p 8080:8080 -v $PWD/state:/var/lib/jenkins jenkins
```
