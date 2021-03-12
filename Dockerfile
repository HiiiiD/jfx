FROM ubuntu:18.04 as builder

WORKDIR /app
RUN apt update
RUN apt install -y libavformat57 libgl1-mesa-dev \
    libx11-dev pkg-config x11proto-core-dev git \
    libgtk2.0-dev libgtk-3-dev \
    pkg-config zip
RUN apt install -y openjdk-11-jdk ant
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
RUN export JAVA_HOME
ADD . .
RUN ./gradlew
RUN zip -r compiled.zip ./build/*
