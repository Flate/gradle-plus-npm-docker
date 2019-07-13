FROM gradle:5.5-jdk11

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

RUN chmod +x /root/.nvm/nvm.sh && /root/.nvm/nvm.sh install node 
