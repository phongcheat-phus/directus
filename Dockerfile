# FROM node:20.11.1 as base
# RUN npm install -g pnpm
# FROM directus/directus:11.3.5
# USER root
# RUN npm install -g pnpm
# USER node
# RUN pnpm install directus-extension-schema-management-module



FROM directus/directus:11.3.5
USER root
RUN npm install -g pnpm
USER node
RUN pnpm install directus-extension-schema-management-module
