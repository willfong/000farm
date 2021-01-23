FROM node:alpine
RUN apk add yarn
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY --chown=node:node . .
USER node
RUN yarn install && yarn generate
EXPOSE 3000
ENV NUXT_HOST 0.0.0.0
CMD [ "yarn", "start" ]
