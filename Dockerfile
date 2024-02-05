FROM continuumio/miniconda3:23.10.0-1

RUN apt update && apt install build-essential -y

WORKDIR /app

COPY . .

RUN conda create -n slora python=3.9

SHELL ["conda", "run", "-n", "slora", "/bin/bash", "-c"]

RUN conda install -y cuda -c nvidia/label/cuda-11.8.0

RUN pip install torch==2.0.1 

#RUN pip install -e .

