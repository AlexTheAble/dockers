FROM ubuntu:14.04



FROM openjdk:8



MAINTAINER Alexander Heavner "alexander.heavner@ncr.com"



# Build variables

ENV ANDROID_SDK_FILE android-sdk_r24.4.1-linux.tgz

ENV ANDROID_SDK_URL https://dl.google.com/android/${ANDROID_SDK_FILE}

ENV ANDROID_BUILD_TOOLS_VERSION 24.0.0

ENV ANDROID_APIS android-19,android-20,android-21,android-22,android-23,android-24

ENV ANDROID_ABI sys-img-armeabi-v7a-android-21,sys-img-armeabi-v7a-android-21

ENV ANDROID_EXTRA extra-android-m2repository

ENV ANDROID_HOME /opt/android-sdk-linux



#Set PATH

ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/$ANDROID_BUILD_TOOLS_VERSION



#Install dependencies

RUN dpkg --add-architecture i386 && apt-get update && echo "y" | apt-get install libc6:i386 libstdc++6:i386 && echo "y" | apt-get install zlib1g:i386 && apt-get clean



#Copy over scripts

COPY scripts /opt/scripts



#Set working directory

WORKDIR "/opt"



#Install Android SDK

RUN curl -L ${ANDROID_SDK_URL} | tar xz -C .

RUN echo y | android update sdk -a -u -t platform-tools,$ANDROID_APIS,build-tools-$ANDROID_BUILD_TOOLS_VERSION,$ANDROID_ABI,$ANDROID_EXTRA



#Clean up

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get autoremove -y && apt-get clean
