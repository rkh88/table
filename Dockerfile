FROM node:12-alpine as builder
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json .
COPY package-lock.json .
ADD src /usr/src/app/src
ADD public /usr/src/app/public
RUN npm build
EXPOSE 8080
COPY . .
CMD [ "npm", "start" ]