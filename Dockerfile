FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

ENV DEBIAN_FRONTEND noninteractive
ENV USER root

RUN apt-get update && apt-get install -y\
    --no-install-recommends ubuntu-desktop \
    && gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal \
    && tightvncserver \
    && mkdir /root/.vnc

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    apt-utils \
    python3 \
    python3-dev \
    python3-pip \
    curl \
    git \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get upgrade -y \
    && pip3 install --upgrade pip

RUN pip3 --no-cache-dir install \
    Pillow \
    h5py \
    html5lib \
    bleach \
    matplotlib \
    numpy \
    pandas \
    scipy

RUN pip3 --no-cache-dir install \
    jupyterlab \
    tensorflow-gpu

ADD jupyter_config.py /root/.jupyter
ADD xstartup /root/.vnc/xstartup
ADD passwd /root/.vnc/passwd

RUN chmod 600 /root/.vnc/passwd

CMD /usr/bin/vncserver :1 -geometry 1280x800 -depth 24 && tail -f /root/.vnc/*:1.log

# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888
# VNC
EXPOSE 5901
