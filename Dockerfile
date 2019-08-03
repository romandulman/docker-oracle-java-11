FROM ubuntu:18.04

LABEL "org.label-schema.vendor"="Oracle" \
    version="1.0" \
    maintainer="Roman Dulman" \
    description="Oracle Java 11 JDK"
    
# Install Java
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y  software-properties-common && \
    add-apt-repository  ppa:linuxuprising/java -y && \
    apt-get update && \
    echo oracle-java11-installer shared/accepted-oracle-license-v1-2 select true |  /usr/bin/debconf-set-selections  && \
    apt-get install -y oracle-java11-installer && \
    apt-get clean
 
# Define JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-12-oracle

CMD ["bash"]
