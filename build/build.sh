# -- Software Stack Version

SPARK_VERSION="3.0.0"
HADOOP_VERSION="2.7"
JUPYTERLAB_VERSION="2.1.5"

# -- Building the Images

docker build \
  -f docker/cluster-base/Dockerfile \
  -t cluster-base:latest .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg hadoop_version="${HADOOP_VERSION}" \
  -f docker/spark-base/Dockerfile \
  -t spark-base:${SPARK_VERSION} .

docker build \
  -f docker/spark-master/Dockerfile \
  -t spark-master:${SPARK_VERSION} .

docker build \
  -f docker/spark-worker/Dockerfile \
  -t spark-worker:${SPARK_VERSION} .

docker build \
  --build-arg spark_version="${SPARK_VERSION}" \
  --build-arg jupyterlab_version="${JUPYTERLAB_VERSION}" \
  -f docker/jupyterlab/Dockerfile \
  -t jupyterlab:${JUPYTERLAB_VERSION}-spark-${SPARK_VERSION} .
