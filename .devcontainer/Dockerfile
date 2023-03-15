FROM node:19.7-slim

# Install basic development tools
RUN apt update && apt install -y less man-db sudo yarn git curl

# Ensure default `node` user has access to `sudo`
ARG USERNAME=node
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME



# Install base dependencies
RUN npm install -g npm@9.6.1
RUN npm install -g sfdx-cli@latest node-gyp@latest make@latest gcc@latest graceful-fs@latest uuid@latest
RUN yarn add electron-builder --dev
RUN npm install -g electron@latest
RUN npm update -g && npm outdated

WORKDIR /usr/app
COPY ./ ./
RUN npm install -g nodehun@latest


# download Zettlr
WORKDIR /home
RUN git clone https://github.com/Zettlr/Zettlr.git
WORKDIR /home/Zettlr
RUN yarn install --frozen-lockfile

# Set `DEVCONTAINER` environment variable to help with orientation
ENV DEVCONTAINER=true