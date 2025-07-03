FROM node:18.19.0-slim

RUN corepack enable
RUN yarn add pnpm@8.14.3