FROM node:lts-alpine

# Install basic development tools
RUN npm install -g npm@latest 
# node-gyp@latest
RUN apk add python3 make g++ git curl

# Ensure default `node` user has access to `sudo`
#ARG USERNAME=node
#RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
#   && chmod 0440 /etc/sudoers.d/$USERNAME

# Install base dependencies
#RUN npm install -g npm@9.6.1
#RUN npm install -g sfdx-cli@latest  make@latest gcc@latest graceful-fs@latest uuid@latest
RUN yarn add electron-builder --dev
#RUN npm install -g electron@latest
#RUN npm update -g && npm outdated

WORKDIR /usr/app
RUN npm install -g nodehun@latest

# download Zettlr
WORKDIR /home/Zettlr
CMD npm install && npm audit fix --force && yarn install --frozen-lockfile ; sleep infinity

# Set `DEVCONTAINER` environment variable to help with orientation
ENV DEVCONTAINER=true