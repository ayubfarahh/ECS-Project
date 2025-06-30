# PART 1 Build the app
FROM node:18-alpine AS builder

WORKDIR /app

COPY package.json yarn.lock ./
RUN yarn install 

COPY . .
RUN yarn build

# PART 2 Reduce the image
FROM node:18-alpine

WORKDIR /app

# Copy built files from previous stage
COPY --from=builder /app/build ./build

# Install `serve` globally
RUN yarn global add serve

EXPOSE 3000

CMD ["serve", "-s", "build"]
