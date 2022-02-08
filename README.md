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
