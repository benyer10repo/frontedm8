FROM node:lts-alpine as build-stage
WORKDIR /frontedm8/database/
RUN npm install -g json-server
COPY . .
ENTRYPOINT ["json-server", "db.json", "--port", "5000", "--host", "0.0.0.0"]