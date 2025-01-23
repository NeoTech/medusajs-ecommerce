FROM ubuntu:25.04 AS build
USER root
WORKDIR /app
ARG FILENAME=fnm-linux
ARG FNM_VERSION=v1.38.1
SHELL ["/bin/bash", "-c"]
ENV SHELL=/bin/bash
ENV FNM_PATH="/root/.local/share/fnm"
ENV PATH=$PATH:$FNM_PATH
RUN apt update -qq 
RUN DEBIAN_FRONTEND=noninteractive apt-get -yqq install tzdata
RUN DEBIAN_FRONTEND=noninteractive apt-get -yqq install git postgresql-client-17 git unzip curl vim wget
RUN wget https://github.com/Schniz/fnm/releases/download/${FNM_VERSION}/${FILENAME}.zip
RUN unzip ${FILENAME}.zip && mv fnm /usr/sbin/
RUN fnm install v22.13.1
RUN fnm env --shell bash >> fnm.env
RUN source fnm.env && npx create-medusa-app@latest --no-browser --with-nextjs-starter --skip-db store
RUN mv store backend && mv store-storefront frontend
RUN cd backend && echo -e '\nDATABASE_URL=postgres://postgres:psql@medusa-db/medusa' >> .env

FROM node:22-alpine3.20 AS back
WORKDIR /app
COPY --from=build /app/backend /app
RUN cd /app && rm -rf node_modules && rm *lock*
RUN cd /app && npm install
COPY docker-entrypoint.sh /app
CMD ["./docker-entrypoint.sh"]

FROM node:22-alpine3.20 AS front
WORKDIR /app
COPY --from=build /app/frontend /app
RUN cd /app && rm -rf node_modules && rm *lock*
RUN cd /app && npm install
COPY docker-entrypoint.sh /app
CMD ["./docker-entrypoint.sh"]
