FROM jenkins/jenkins:lts

USER root
# jdk 17 + ninja
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk wget unzip curl ninja-build && \
    rm -rf /var/lib/apt/lists/*

# Nodejs
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs
RUN npm install -g npm && \
    chmod -R 755 /usr/lib/node_modules && \
    chmod +x /usr/bin/node && \
    chmod +x /usr/bin/npm

# Android SDK
RUN wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -P /tmp && \
    mkdir -p /opt/android-sdk-linux/cmdline-tools && \
    unzip /tmp/commandlinetools-linux-9477386_latest.zip -d /opt/android-sdk-linux/cmdline-tools && \
    mv /opt/android-sdk-linux/cmdline-tools/cmdline-tools /opt/android-sdk-linux/cmdline-tools/latest && \
    rm /tmp/commandlinetools-linux-9477386_latest.zip

# env variables
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV ANDROID_HOME=/opt/android-sdk-linux
ENV PATH="${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/build-tools/31.0.0"

# sdk licenses, platform 31
RUN yes | sdkmanager --licenses && \
    sdkmanager "platforms;android-31" "build-tools;31.0.0"

# copyy certificate and keystore properties
COPY nexschool.keystore /home/jenkins/nexschool.keystore
COPY keystore.properties /home/jenkins/keystore.properties
