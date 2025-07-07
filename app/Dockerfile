# Build the app
FROM node:18-alpine AS builder

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install 

COPY . .
RUN yarn build

Reduce the image
FROM node:18-alpine

WORKDIR /app


COPY --from=builder /app/build ./build


RUN yarn global add serve

EXPOSE 3000

CMD ["serve", "-s", "build"]
