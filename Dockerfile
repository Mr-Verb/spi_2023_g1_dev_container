FROM node:lts-alpine

# Install basic development tools
RUN npm install -g npm@latest 
# node-gyp@latest
RUN apk add python3 make g++ git curl

# Install base dependencies
RUN yarn add electron-builder --dev
WORKDIR /usr/app
RUN npm install -g nodehun@latest

# Run yarn install after the container is launched
RUN yarn cache clean
CMD sleep 5 ; cd /home/Zettlr ; yarn install --frozen-lockfile ; sleep infinity

# Set `DEVCONTAINER` environment variable to help with orientation
ENV DEVCONTAINER=true