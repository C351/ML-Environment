FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

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

COPY jupyter_config.py /root/.jupyter/

# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888
