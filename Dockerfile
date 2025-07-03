FROM node:22.17.0-slim

RUN corepack enable
RUN yarn add pnpm@10.12.4