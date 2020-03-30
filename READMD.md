# Docker JupyterLab

## Using this Image
### Running the container

The JupyterLab image exposes a shared volume under `/notebooks`, so you can mount a host directory to that point to access persisted container data. A typical invocation of the container might be:
```bash
docker run -d --name jupyterlab \
    -p 8888:8888 \
    -v path-to-notebooks:/notebooks \
    seekie/jupyterlab
```

### Configuration
JupyterLab can be either configured from a config file. To mount a configuration file and use it with the server, you can use this command:

Generate the default configuration file:
```bash
docker run --rm \
    -v $PWD:/root/.jupyter \
    seekie/jupyterlab --generate-config
```

Modify the default configuration, which will now be available under $PWD. Then start the InfluxDB container.
```bash
docker run -d --name jupyterlab \
    -p 8888:8888 \
    -v $PWD:/root/.jupyter \
    -v path-to-notebooks:/notebooks \
    seekie/jupyterlab
```

