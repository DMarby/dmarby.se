FROM node:12.14.0-alpine as nodebuilder
WORKDIR /build
COPY . .
RUN npm ci
RUN npm run-script build

FROM nginx:alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=nodebuilder /build/public /usr/share/nginx/html
EXPOSE 80
