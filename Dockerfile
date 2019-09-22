FROM ubuntu:latest

# See https://stackoverflow.com/a/28390848

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update && apt-get install curl zip unzip ca-certificates gnupg --no-install-recommends -y && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install yarn --no-install-recommends -y 

ENV NODE_VERSION=v12.9.1
ENV NVM_VERSION=0.34.0
ENV ANGULAR_VERSION=8.3.2
ENV JAVA_VERSION=12.0.2-librca
ENV GRADLE_VERSION=5.6.1

ENV PATH=/root/.nvm/versions/node/$NODE_VERSION/bin:/root/.sdkman/candidates/java/current/bin:/root/.sdkman/candidates/gradle/current/bin:$PATH

WORKDIR /root/

ADD get-sdkman.sh /root/get-sdkman.sh

RUN bash /root/get-sdkman.sh

RUN source "/root/.sdkman/bin/sdkman-init.sh" && \
    yes | sdk install java $JAVA_VERSION && \
    yes | sdk install gradle $GRADLE_VERSION

# This also installs NODE_VERSION
RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh | bash 

RUN yarn global add @angular/cli@$ANGULAR_VERSION
