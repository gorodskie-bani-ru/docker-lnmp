FROM node:20-bookworm as build

ARG SITE=boilerplate

ARG ROLE

ARG PWA
ENV PWA $PWA

ARG ENV_MODE
ENV ENV_MODE $ENV_MODE

ARG DATABASE_URL
ENV DATABASE_URL $DATABASE_URL

ARG SUDO_PASSWORD
ENV SUDO_PASSWORD $SUDO_PASSWORD

RUN apt-get update

RUN apt-get install -y bash 
RUN apt-get install -y mc 
RUN apt-get install -y curl 
RUN apt-get install -y python3
RUN apt-get install -y make 
RUN apt-get install -y g++
RUN apt-get install -y git 
RUN apt-get install -y iputils-ping


# FROM mhart/alpine-node:15 as build

# ARG SITE=boilerplate

# ARG ROLE

# ARG endpoint
# ENV endpoint $endpoint

# ARG API_ENDPOINT
# ENV API_ENDPOINT $API_ENDPOINT

# ARG ENV_MODE
# ENV ENV_MODE $ENV_MODE

# ARG PUBLIC_URL
# ENV PUBLIC_URL $PUBLIC_URL

# ARG DATABASE_URL
# ENV DATABASE_URL $DATABASE_URL

# RUN apk add bash 
# RUN apk add mc 
# RUN apk add curl 
# RUN apk add python3 
# RUN apk add make 
# RUN apk add g++
# RUN apk add git

# https://gist.github.com/alextanhongpin/aa55c082a47b9a1b0060a12d85ae7923
# RUN apk --no-cache add ca-certificates wget && \
#     wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
#     wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk && \
#     wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-bin-2.25-r0.apk && \
#     wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-i18n-2.25-r0.apk && \
#     apk add glibc-bin-2.25-r0.apk glibc-i18n-2.25-r0.apk glibc-2.25-r0.apk

# COPY ./locale.md /locale.md
# RUN cat /locale.md | xargs -i /usr/glibc-compat/bin/localedef -i {} -f UTF-8 {}.UTF-8

# RUN apk add --upgrade --no-cache vips-dev build-base \
#   --repository https://alpine.global.ssl.fastly.net/alpine/v3.10/community/

WORKDIR /www/${SITE}/

COPY ./${SITE}/package.json ./${SITE}/package-lock.json ./
RUN npm ci
COPY ./bin/* /usr/bin/
COPY ./${SITE} .

# Установку зависимостей нельзя переносить в entrypoint,
# потому что тот скрипт срабатывает уже тогда, когда контейнер создан и заменен имеющийся (если уже был запущен)
RUN npm ci

RUN if [ "$ROLE" = "FRONT" ] ; then echo Build front ; /usr/bin/front.sh ; fi
