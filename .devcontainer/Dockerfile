FROM node:19.7-slim

# Install basic development tools
RUN apt update && apt install -y less man-db sudo yarn git curl

# Ensure default `node` user has access to `sudo`
ARG USERNAME=node
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

WORKDIR /usr/app
COPY ./ ./

# Install base dependencies
RUN npm install -g npm@9.6.1
RUN npm update
RUN npm install -g sfdx-cli node-gyp make gcc
RUN npm install nodehun
RUN yarn add electron-builder --dev

# download Zettlr
WORKDIR "/home"
RUN git clone https://github.com/Zettlr/Zettlr.git
WORKDIR "/home/Zettlr"
RUN yarn install --frozen-lockfile

# Set `DEVCONTAINER` environment variable to help with orientation
ENV DEVCONTAINER=true