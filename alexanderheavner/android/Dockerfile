FROM ubuntu:14.04

FROM openjdk:8

MAINTAINER Alexander Heavner "alexander.heavner@ncr.com"


# Build variables

ENV ANDROID_SDK_FILE android-sdk_r24.4.1-linux.tgz

ENV ANDROID_SDK_URL https://dl.google.com/android/${ANDROID_SDK_FILE}

ENV ANDROID_BUILD_TOOLS_VERSION 24.0.0

ENV ANDROID_APIS android-24

ENV ANDROID_ABI sys-img-armeabi-v7a-android-24

ENV ANDROID_EXTRA extra-android-m2repository,extra-google-google_play_services,extra-google-m2repository

ENV ANDROID_HOME /opt/android-sdk-linux

#Set PATH

ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/$ANDROID_BUILD_TOOLS_VERSION

#Install dependencies

RUN apt-get update && dpkg --add-architecture i386 && apt-get update && echo "y" | apt-get install libc6:i386 libstdc++6:i386 && echo "y" | apt-get install zlib1g:i386 && apt-get clean

#Move to /opt directory for instillation

WORKDIR /opt

#Install Android SDK

RUN curl -L ${ANDROID_SDK_URL} | tar xz -C .

RUN echo y | android update sdk -a -u -t platform-tools && echo y | android update sdk -a -u -t $ANDROID_APIS && echo y | android update sdk -a -u -t build-tools-$ANDROID_BUILD_TOOLS_VERSION && echo y | android update sdk -a -u -t $ANDROID_ABI && echo y | android update sdk -a -u -t $ANDROID_EXTRA


#Clean up

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get autoremove -y && apt-get clean

#Set working directy in /opt/wrokspace. This is where we will import our project directory.

WORKDIR /opt/workspace
