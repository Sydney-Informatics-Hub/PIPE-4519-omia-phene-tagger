FROM nvidia/cuda:11.2.2-cudnn8-devel-ubuntu20.04

RUN apt-get update -y && \
    apt-get install -y curl git build-essential && \
    apt-get clean


# Make the dir everything will go in
WORKDIR /build
# Install miniconda
ENV PATH="/build/miniconda3/bin:${PATH}"
ARG PATH="/build/miniconda3/bin:${PATH}"
RUN curl -o miniconda.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh 
RUN mkdir /build/.conda
RUN bash miniconda.sh -b -p /build/miniconda3
RUN rm -rf miniconda.sh
# Newer versions of conda have a faster dependency solver
RUN conda update -n base conda

RUN mkdir /project /scratch && touch /usr/bin/nvidia-smi

RUN conda --version
COPY environment.yml /project
WORKDIR /project
RUN conda env create --file environment.yml

RUN conda clean -a -y

RUN echo "source activate omia_tagger" > ~/.bashrc
ENV PATH /opt/conda/envs/omia_tagger/bin:$PATH

