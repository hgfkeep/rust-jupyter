FROM rust:latest
COPY ./config /config
RUN useradd -m jupyter
WORKDIR /home/jupyter
RUN mkdir /home/jupyter/notebooks
RUN apt update \
    && apt install -y jupyter-notebook cmake \
    && rm -rf /var/lib/apt/lists/*
RUN cargo install evcxr_jupyter
RUN chown jupyter:jupyter /home/jupyter/notebooks
USER 1000:1000
RUN evcxr_jupyter --install
CMD jupyter notebook --config=/config/jupyter/jupyter_notebook_config.py
