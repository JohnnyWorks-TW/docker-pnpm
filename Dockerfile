FROM node:20.19.0-slim

RUN corepack enable
RUN yarn add pnpm@10.12.4