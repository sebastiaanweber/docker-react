FROM node:alpine as builder
WORKDIR /app
COPY package.json /app
RUN npm install
COPY ./ /app
RUN npm run build
#/app/build/ contains files

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html