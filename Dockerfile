## Base

FROM node:12.16-slim as base
ENV NODE_ENV=production
EXPOSE 3000
RUN apt-get update -qq && \
    apt-get install -qy \
    git \
    nano \
    ca-certificates \
    bzip2 \
    curl \
    libfontconfig \
    --no-install-recommends
RUN rm -rf /var/lib/apt/lists/*

## Development

FROM base as dev
ENV NODE_ENV=development
WORKDIR /usr/src/app
RUN npm i nodemon -g --loglevel notice
COPY package*.json ./
RUN npm install
CMD [ "nodemon", "-L", "--inspect=0.0.0.0:9229", "src/app.js" ]

### Test ###

FROM base as test
ENV NODE_ENV=development
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci && \
    npm cache clean --force
COPY . .
CMD [ "npm", "run", "test" ]

### Production ###

FROM test as pre-prod
RUN rm -rf ./tests && \
    rm -rf ./node_modules

FROM base as prod
ENV NODE_ENV=production
COPY --from=pre-prod /usr/src/app /usr/src/app
WORKDIR /usr/src/app
RUN chown -R node:node .
USER node
RUN npm ci --production && \
    npm cache clean --force
CMD [ "node", "src/app.js" ]
