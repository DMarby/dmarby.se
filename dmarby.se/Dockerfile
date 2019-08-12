FROM node:10.16.2-alpine as nodebuilder
WORKDIR /build
COPY . .
RUN npm install && npm run-script build

FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=nodebuilder /build/public /usr/share/nginx/html
EXPOSE 80
