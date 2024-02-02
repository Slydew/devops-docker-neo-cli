FROM maven:3.5-jdk-8-alpine

LABEL org.opencontainers.image.source=https://github.com/Slydew/devops-docker-neo-cli
LABEL org.opencontainers.image.description="An image for the SAP neo cli with git support"
LABEL org.opencontainers.image.licenses=Apache-2.0

ARG NEO_SDK_VERSION=1.163.6

RUN  apt-get update && \
     apt-get install -y git && \
     apk add --no-cache bash && \
     mvn --batch-mode com.sap.cloud:neo-javaee7-wp-maven-plugin:${NEO_SDK_VERSION}:install-sdk -DsdkInstallPath=sdk -Dincludes=tools/**,license/**,sdk.version && \
     chmod -R 777 sdk && \
     ln -s /sdk/tools/neo.sh /usr/bin/neo.sh && \
     rm -rf /var/lib/apt/lists/*
