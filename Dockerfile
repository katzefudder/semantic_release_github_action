FROM node:14.16.0-alpine3.12

ENV PATH="$PATH:/npm/node_modules/.bin"

RUN apk --update --no-cache add bash curl git git-lfs openssh docker

COPY ./package.json package-lock.json /npm/

RUN cd /npm && \
  npm install && npm ci

CMD [ "semantic-release" ]
