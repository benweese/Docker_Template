FROM alpine:latest
MAINTAINER ben.weese@gmail.com

COPY . /test

RUN apk update && apk add \
    curl \
    git \
    vim \
    chromium \
    chromium-chromedriver \
    python3 \
    openjdk11 \
    maven \
    --update npm
    
RUN python3 -m pip install --upgrade pip \
    && pip install pipenv 

RUN npm install -g newman \
    && npm install -g newman-reporter-htmlextra

#install Gradle
RUN wget -q https://services.gradle.org/distributions/gradle-5.6.1-bin.zip \
    && unzip gradle-5.6.1-bin.zip -d /opt \
    && rm gradle-5.6.1-bin.zip

# Set Gradle in the environment variables
ENV GRADLE_HOME /opt/gradle-5.6.1
ENV PATH $PATH:$GRADLE_HOME/bin

CMD cd test

RUN pipenv install --dev
