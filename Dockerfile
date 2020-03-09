FROM rust:slim
COPY ./config /config
RUN useradd -m jupyter
WORKDIR /home/jupyter
RUN mkdir /home/jupyter/notebooks \
    && apt update \
    && apt install -y jupyter-notebook cmake \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/bin/pip3 /usr/bin/pip 
RUN cargo install evcxr_jupyter cargo-edit
RUN chown jupyter:jupyter /home/jupyter/notebooks
USER 1000:1000
RUN evcxr_jupyter --install
ENV CARGO_HOME=/home/jupyter/.local/lib/cargo
CMD jupyter notebook --config=/config/jupyter/jupyter_notebook_config.py
