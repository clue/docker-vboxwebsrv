# docker-vboxwebsrv

This is a minimal [docker](https://www.docker.io) image that allows you to connect to a computer running VirtualBox
through SSH and expose its SOAP WebService (vboxwebsrv) on your machine.

This is particularly intended for use with the [clue/phpvirtualbox](https://github.com/clue/docker-phpvirtualbox)
docker image.

![](https://cloud.githubusercontent.com/assets/776829/3137332/d8500a54-e850-11e3-921d-479d43c9c80a.png)

## Usage

This docker image is available as a [trusted build on the docker index](https://index.docker.io/u/clue/vboxwebsrv/).
Using this image for the first time will start a download automatically.
Further runs will be immediate, as the image will be cached locally.

The recommended way to run this container looks like this:

```bash
$ docker run -it --name=vb1 clue/vboxwebsrv vbox@10.1.2.3
```

This will start an interactive container that will establish a connection to the given host.
The host `10.1.2.3` is your computer that VirtualBox is installed on.

To establish an encrypted SSH connection it will likely ask for your password for user `vbox`.
This is the user that runs your virtual machines (VMs).

Once connected, it will launch a temporary instance of the  `vboxwebsrv` program that comes with VirtualBox.
This will be exposed through the SSH tunnel to your docker container and will terminate when your container
terminates.

The next step would be linking your `vb1` container to your phpVirtualBox container.
Please see [clue/phpvirtualbox](https://github.com/clue/docker-phpvirtualbox) for details, a common
way to link them together looks like this:

```bash
$ docker run -d --link vb1:MyComputer -p 80:80 clue/phpvirtualbox
```
