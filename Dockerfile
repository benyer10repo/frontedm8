FROM node:lts-alpine as build-stage
WORKDIR /frontedm8

COPY package*.json /frontedm8
RUN npm install -g @vue/cli
RUN npm install -g json-server
RUN npm install

COPY . /frontedm8

RUN npm run build --prod

CMD ["npm","run", "serve"]

FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /frontedm8/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]