# use the latest node LTS release
#FROM node:14.15.4-alpine3.12 // this is the version but I use the sha for deterministic image
FROM node@sha256:55bf28ea11b18fd914e1242835ea3299ec76f5a034e8c6e42b2ede70064e338c
RUN apk add dumb-init
ENV NODE_ENV production
ENV PORT 8080
WORKDIR /usr/src/app

COPY --chown=node:node . .
RUN npm ci --only=production
# expose port 3000 and start the app
EXPOSE 8080
USER node
CMD ["dumb-init", "node", "bin/www"]