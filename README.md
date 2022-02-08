# Cluster Hadoop : Machine Learning and Spark

## Objectif of project 

The objective of our project is to use a Big Data solution (Spark in our case) and machine learning algorithms via Docker to do the containerization.

Apache Spark is a cluster computing engine designed to be fast and general-purpose, making it the ideal choice for processing of large datasets. It answers those two points with efficient data sharing accross computations.

## Build our App

Note: Local build is currently only supported on Linux OS distributions.

1. Download the source code or clone the repository;
2. Move to the build directory;
```javascript
cd build
```
3. Edit the build.yml file with your favorite tech stack version;
4. Match those version on the docker compose file;
5. Build up the images;
```javascript
chmod +x build.sh ; ./build.sh
```
6. Start the cluster;
```javascript
docker-compose up
```
7. check out the components web UI:
- JupyterLab at localhost:8888;
- Spark master at localhost:8080;
- Spark worker I at localhost:8081;
- Spark worker II at localhost:8082;

*Note* : you must replace localhost with the IP address of your machine

8. Stop the cluster by typing ctrl+c on the terminal;
9. Run step 6 to restart the cluster.

## Architecture

![Alt text](https://github.com/chissi007/projet-docker/blob/main/build/workspace/data/architecture.png?raw=true "Title")

The cluster is composed of four main components: the JupyterLab IDE, the Spark master node and two Spark workers nodes. The user connects to the master node and submits Spark commands through the nice GUI provided by Jupyter notebooks. The master node processes the input and distributes the computing workload to workers nodes, sending back the results to the IDE. The components are connected using the network and share data among each other via a shared mounted volume that simulates an HDFS.

## Contents of the containers 

### Cluster base image
The cluster base image will download and install common software tools (Java, Python, etc.) and will create the shared directory for the HDFS.
We are using a Linux distribution to install Java 8 (or 11), Apache Spark only requirement. We also need to install Python 3 for PySpark support and to create the shared volume to simulate the HDFS.

### Spark base image
For the Spark base image, we will get and setup Apache Spark in standalone mode, its simplest deploy configuration. In this mode, we will be using its resource manager to setup containers to run either as a master or a worker node. In contrast, resources managers such as Apache YARN dynamically allocates containers as master or worker nodes according to the user workload. Furthermore, we will get an Apache Spark version with Apache Hadoop support to allow the cluster to simulate the HDFS using the shared volume created in the base cluster image.

### Spark master image
For the Spark master image, we will set up the Apache Spark application to run as a master node. We will configure network ports to allow the network connection with worker nodes and to expose the master web UI, a web page to monitor the master node activities. In the end, we will set up the container startup command for starting the node as a master instance.

### Spark worker image
For the Spark worker image, we will set up the Apache Spark application to run as a worker node. Similar to the master node, we will configure the network port to expose the worker web UI, a web page to monitor the worker node activities, and set up the container startup command for starting the node as a worker instance.

### JupyterLab image
For the JupyterLab image, we go back a bit and start again from the cluster base image. We will install and configure the IDE along with a slightly different Apache Spark distribution from the one installed on Spark nodes.
