# docker-rust-jupyter

[中文说明](./README-zh.md)

A containerized version of the [Evcxr](https://github.com/google/evcxr), an evaluation context/REPL for Rust as a Jupyter kernel.

## Default Setting

* Notebook dir : `/home/jupyter/notebooks`
* server port: **8888**
* Login password: **hgfkeep**

## Usage

Just pull the docker image from the Docker hub:

`docker run --rm -p 8888:8888 hgfdodo/evcxr`

And go to `http://localhost:8888`

Or build it yourself by cloning this repo:
```
git clone  https://github.com/cheperuiz/docker-rust-jupyter
cd docker-rust-jupyter
docker build -t hgfdodo/evcxr .
```

> ⚠️ mount volume  owner's user  must be  `1000:1000`。

