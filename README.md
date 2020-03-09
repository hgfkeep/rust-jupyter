# docker-rust-jupyter

[中文说明](https://github.com/hgfkeep/rust-jupyter/blob/master/README-zh.md)

A containerized version of the [Evcxr](https://github.com/google/evcxr), an evaluation context/REPL for Rust as a Jupyter kernel.

👏welcome to use， please **star** this project if it's helpful for you! Thank you!

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


## Optioanl: Install packages in jupyter

in python jupyter, just input：

```
!pip install numpy
```

python packages will install in `/home/jupyter/.local/lib/python3.7/`.

If we want to install package with `cargo`， we can also do it the same way but **in python kernel**, rust kernel do not allow execute system commands!

```
!cargo install fmt
```

or use cargo-edit extension for non-binary dependencies.

```
!cargo add time
```

cargo packages will install in `/home/jupyter/.local/lib/cargo`.

## use external packages in jupyter

```
:dep base64 = "0.10.1"
base64::encode(&vec![1, 2, 3, 4])
```

> 更多jupyter的使用场景和例子，参考：[rust-jupyter-example.ipynb](https://github.com/hgfkeep/rust-jupyter/blob/master/rust-jupyter-example.ipynb)

## Update Log

### v1.0[latest]

1. add soft link of pip3
2. change `CARGO_HOME=/home/jupyter/.local/lib/cargo`
3. rust jupyter can add packages in jupyter


