FROM node:20.11.1 as base
RUN wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.bashrc" SHELL="$(which bash)" bash -
RUN npm install --global corepack@latest
RUN corepack enable pnpm
RUN corepack use pnpm@latest-10

FROM directus/directus:11.3.5
USER root
RUN corepack enable
USER node
RUN pnpm install directus-extension-schema-management-module
