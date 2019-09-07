# Docker Template for Test Automation
This project is for practiceing Docker and creating my own container for my test.

## Badges
![Actions](https://github.com/benweese/test_automation/workflows/Docker%20Image%20CI/badge.svg) ![Docker Hub](https://img.shields.io/docker/cloud/build/benweese/test_automation) ![GitHub](https://img.shields.io/github/license/benweese/test_automation.svg) ![GitHub issues](https://img.shields.io/github/issues-raw/benweese/test_automation.svg)

## Motivation
This is to Learn Docker and create my own container.

## Tools
- [Docker](https://www.docker.com/)
- [GitHub Actions](https://github.com/features/actions)
- [Docker Hub](https://hub.docker.com/)

## Features
Using this image for testing UI or API.

## Code Example
<b>Dockerfile</b>
```
FROM alpine:latest
LABEL maintainer="ben@benweese.dev"

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
```

## Documentation
- [Docker: Get Started](https://docs.docker.com/get-started/)

## Credits
[Ben Weese](https://benweese.dev)
