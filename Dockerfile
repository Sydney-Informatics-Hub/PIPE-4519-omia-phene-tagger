FROM nvidia/cuda:12.3.0-devel-ubuntu20.04

RUN apt-get update -y && \
    apt-get install -y curl git build-essential && \
    apt-get clean


# Make the dir everything will go in
WORKDIR /build
# Install miniconda
ENV PATH="/build/miniconda3/bin:${PATH}"
ARG PATH="/build/miniconda3/bin:${PATH}"
RUN curl -o miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-aarch64.sh &&\
	mkdir /build/.conda && \
	bash miniconda.sh -b -p /build/miniconda3 &&\
	rm -rf miniconda.sh

RUN mkdir /project /scratch && touch /usr/bin/nvidia-smi

RUN conda --version
COPY environment.yml /project
WORKDIR /project
RUN conda env create --file environment.yml

RUN conda clean -a -y

SHELL ["conda", "run", "-n", "omia_tagger", "/bin/bash", "-c"]

