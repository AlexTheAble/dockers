FROM ubuntu:14.04



FROM openjdk:8



MAINTAINER Alexander Heavner "alexander.heavner@ncr.com"



# Build variables

ENV ANDROID_SDK_FILE android-sdk_r24.4.1-linux.tgz

ENV ANDROID_SDK_URL https://dl.google.com/android/${ANDROID_SDK_FILE}

ENV ANDROID_BUILD_TOOLS_VERSION 24.0.0

ENV ANDROID_APIS android-24

ENV ANDROID_ABI sys-img-armeabi-v7a-android-24

ENV ANDROID_EXTRA extra-android-m2repository

ENV ANDROID_HOME /opt/android-sdk-linux

ENV AVD_DEVICE Nexus\ 6

ENV AVD_NAME emu

ENV AVD_TARGET android-24

ENV AVD_ABI armeabi-v7a

ENV AVD_SKIN WVGA800

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

RUN echo y | android update sdk -a -u -t platform-tools && echo y | android update sdk -a -u -t $ANDROID_APIS && echo y | android update sdk -a -u -t build-tools-$ANDROID_BUILD_TOOLS_VERSION && echo y | android update sdk -a -u -t $ANDROID_ABI && echo y | android update sdk -a -u -t $ANDROID_EXTRA

#Create AVD

RUN echo "no" | android create avd \
	--force \
	--device "Nexus 6" \
	--name $AVD_NAME \
	--target $AVD_TARGET \
	--abi $AVD_ABI \
	--skin $AVD_SKIN


#Clean up

RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && apt-get autoremove -y && apt-get clean
