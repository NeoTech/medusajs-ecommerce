FROM node:22-alpine3.20 AS back
WORKDIR /app
RUN apk update && apk add git
RUN ["npx","create-medusa-app@latest", "--no-browser","--skip-db", "--with-nextjs-starter","store"]
RUN ["sh","-c", "rm -rf store-storefront"]
RUN ["sh","-c", "mv ./store/* ."]
RUN ["sh","-c", "rm -rf store"]
RUN ["sh","-c", "ls -l"]
COPY docker-entrypoint.sh /app/docker-entrypoint.sh
CMD ["sh", "-c", "/app/docker-entrypoint.sh"]

FROM node:22-alpine3.20 AS front
WORKDIR /app
RUN apk update && apk add git
RUN git clone https://github.com/medusajs/nextjs-starter-medusa.git .
RUN npm install
COPY docker-entrypoint.sh /app/docker-entrypoint.sh
CMD ["sh", "-c", "/app/docker-entrypoint.sh"]
