FROM gradle:5.5-jdk11

# See https://stackoverflow.com/a/28390848

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV NODE_VERSION=12.6.0
ENV NVM_VERSION=0.34.0

ENV NVM_DIR=/usr/local/nvm

RUN mkdir -p $NVM_DIR && \
    curl https://raw.githubusercontent.com/creationix/nvm/v$NVM_VERSION/install.sh | bash && \
    . $NVM_DIR/nvm.sh && \
    nvm install $NODE_VERSION && \
    nvm alias default $NODE_VERSIOn && \
    nvm use default

ENV NODE_PATH=$NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH=$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN npm install -g @angular/cli
