#Pull in base image
FROM alexanderheavner/android:latest

# Build variables

ENV AVD_DEVICE Nexus\ 6

ENV AVD_NAME emu

ENV AVD_TARGET android-24

ENV AVD_ABI armeabi-v7a

ENV AVD_SKIN WVGA800

ENV EMULATOR emulator64-arm

#Copy over scripts

COPY scripts /opt/scripts

#Create AVD

RUN echo "no" | android create avd \
	--force \
	--device "Nexus 6" \
	--name $AVD_NAME \
	--target $AVD_TARGET \
	--abi $AVD_ABI \
	--skin $AVD_SKIN

#Run emulator
RUN sh /opt/scripts/start-emulator.sh
