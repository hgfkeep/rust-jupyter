# docker-rust-jupyter

[Evcxr - rust Jupyter内核](https://github.com/google/evcxr)的容器化版本。

## 镜像默认配置

* notebooks目录：`/home/jupyter/notebooks`
* 端口：**8888**
* 登陆密码：**hgfkeep**



## 使用方法

### 运行方法

从docker hub 上拉取镜像，然后运行：

`docker run --rm -p 8888:8888 hgfdodo/evcxr`

在浏览器中输入 `http://localhost:8888` 就可使用。

> ⚠️：如果使用docker `-v`参数，将存储挂载到notebook目录，请保证外部存储目录owner 用户组为 `1000:1000` 。（修改外部存储用户组 `chown -R 1000:1000 notebooks`）

### 在jupyter中安装package

jupyter重，使用pip安装package是：进入 python jupyter，输入：

```
!pip install numpy
```

python 包会安装在 `/home/jupyter/.local/lib/python3.7/`

如果希望使用cargo 安装rust的软件包，也可以使用类似的方法，但是 **只能在python kernel的时候安装，rust kernel 不支持运行本地二进制文件**。

```
!cargo install fmt
```
cargo 安装的软件包会在 `/home/jupyter/.local/lib/cargo`.

## 自己打包镜像


```
git clone  https://github.com/cheperuiz/docker-rust-jupyter
cd docker-rust-jupyter
docker build -t hgfdodo/evcxr .
```

### 配置端口

需要修改镜像的默认端口，可以有两种方法：

1. **临时方案**：镜像的启动命令改为  jupyter notebook --no-browser **--port=[some_port]** --config=/config/jupyter/jupyter_notebook_config.py。 直接覆盖config文件夹的配置。docker运行时，可直接使用docker 参数覆盖默认的启动参数，例如： `docker run -d  jupyter notebook --no-browser --port=[some_port] --config=/config/jupyter/jupyter_notebook_config.py`
2. **永久方案**：编辑配置文件`config/jupyter/jupyter_notebook_config.py`中的`c.NotebookApp.port = [port]`, 其中`[port]`表示目标默认端口。



### 配置notebook 目录

1. **临时方案**：镜像的启动命令改为  jupyter notebook --no-browser **--notebook-dir=[some_notebook_dir]** --config=/config/jupyter/jupyter_notebook_config.py。 命令行配置的`some_notebook_dir`会直接覆盖config文件夹的配置。docker运行时，可直接使用docker 参数覆盖默认的启动参数，例如： `docker run -d  jupyter notebook --no-browser --notebook-dir=[some_dir] --config=/config/jupyter/jupyter_notebook_config.py`
2. **永久方案**：编辑配置文件`config/jupyter/jupyter_notebook_config.py`中的`c.NotebookApp.notebook_dir = "[some_dir]"`, 其中`[some_dir]`表示目标默认notebook存储目录。

