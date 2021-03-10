FROM ubuntu:20.10 as builder

WORKDIR /app
RUN apt update
RUN apt install -y libavformat58 libgl1-mesa-dev \
    libx11-dev pkg-config x11proto-core-dev git \
    libgtk2.0-dev libgtk-3-dev \
    pkg-config libxxf86vm-dev zip
RUN apt install -y openjdk-11-jdk ant
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64/
RUN export JAVA_HOME
ADD . .
RUN ./gradlew
RUN zip -r compiled.zip ./build/*
