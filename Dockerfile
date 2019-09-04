FROM alpine:latest
MAINTAINER ben.weese@gmail.com

RUN apk update && apk add \
    curl \
    git \
    vim \
    chromium \
    chromium-chromedriver \
    python3 \
    maven \
    --update npm
    
RUN python3 -m pip install --upgrade pip \
    && pip install pipenv 

RUN npm install -g newman \
    && npm install -g newman-reporter-htmlextra
    
RUN mkdir /opt; cd /opt; \
    wget https://download.java.net/java/early_access/alpine/25/binaries/openjdk-11-ea+25_linux-x64-musl_bin.tar.gz \
    && tar zxf openjdk-11-ea+25_linux-x64-musl_bin.tar.gz \
    && ln -s jdk-11 java \
    && rm -f openjdk-11-ea+25_linux-x64-musl_bin.tar.gz
    
ENV JAVA_HOME /opt/java
ENV PATH $PATH:$JAVA_HOME/bin

#install Gradle
RUN wget -q https://services.gradle.org/distributions/gradle-5.6.1-bin.zip \
    && unzip gradle-5.6.1-bin.zip -d /opt \
    && rm gradle-5.6.1-bin.zip

# Set Gradle in the environment variables
ENV GRADLE_HOME /opt/gradle-5.6.1
ENV PATH $PATH:$GRADLE_HOME/bin
