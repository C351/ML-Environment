# Machine Learning Environment

GPU-Enabled Development Environment using Docker

#### Included

-  JupyterLab

- TensorFlow with GPU support

- CUDA 9.0 + cuDNN 7.0

## Requirments:

- ##### [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) 

###### For nvidia-docker to work see the following:

- ###### [Prerequisites](https://github.com/NVIDIA/nvidia-docker/wiki/Installation-(version-2.0)#perequisites) / [NVIDIA driver](https://github.com/NVIDIA/nvidia-docker/wiki/Frequently-Asked-Questions#how-do-i-install-the-nvidia-driver) / [Supported Version](https://github.com/NVIDIA/nvidia-docker/wiki/Frequently-Asked-Questions#which-docker-packages-are-supported) / [Docker](https://docs.docker.com/engine/installation/)

## Build

    git clone https://github.com/CR351/ML-Environment

    cd ML-Environment

    sudo docker build -t ml-env .

## Run

######  Change path "/host/dir" to local work directory

    sudo nvidia-docker run -it -p 6006:6006 -p 8888:8888 -v /host/dir:/home ml-env

## Run (Desktop)

including ubuntu-desktop and vncserver.

    sudo nvidia-docker run -it -p 6006:6006 -p 8888:8888 -p 5901:5901 -v /host/dir:/home ml-env

and then connect to:

`vnc://<host>:5901` via VNC client.

The VNC password is `password`.

## Once inside the container

#### Jupyterlab

    jupyter-lab --allow-root

###### http://localhost:8888/lab

#### Tensorboard

    tensorboard --logdir=/tmp/

###### http://localhost:6006/
