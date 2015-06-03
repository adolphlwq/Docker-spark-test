#test building Spark development environment

#version 0.2.1
FROM adolphlwq/ubuntu:14.04_64_base_image
MAINTAINER adolphlwq <kenan3015@gmail.com>

ENV REFRESHED_AT 2015-6-1

#install wget
RUN apt-get install -yqq wget

#install scala and config scala environment
RUN cd /opt && wget http://downloads.typesafe.com/scala/2.11.6/scala-2.11.6.tgz && tar -xvf scala-2.11.6.tgz && rm scala-2.11.6.tgz
#RUN tar -xzvf scala-2.11.6.tgz && rm scala-2.11.6.tgz && mv scala-2.11.6/ scala

#install spark-hadoop-2.6+
RUN cd /opt && wget http://mirrors.hust.edu.cn/apache/spark/spark-1.3.1/spark-1.3.1-bin-hadoop2.6.tgz && tar -xvf spark-1.3.1-bin-hadoop2.6.tgz && rm spark-1.3.1-bin-hadoop2.6.tgz

#install java
RUN cd /opt && wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz" && tar -xvf jdk-8u45-linux-x64.tar.gz && rm jdk-8u45-linux-x64.tar.gz

#cinfig scala and java environmewnt
ADD env_config /opt/ 
RUN cat /opt/env_config >> /etc/bash.bashrc && rm /opt/env_config*

LABEL JDK_VERSION="1.8.0_45" SCALA_VERSION="2.11.6" SPARK_VERSION="1.3.1" HADOOP_VERSION="2.6"

#CMD ["/bin/bash", "spark-shell", "--master", "local[2]"]
ENTRYPOINT ["bin/bash"]
