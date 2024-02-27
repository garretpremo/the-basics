FROM node:20 as build
WORKDIR /basics
COPY basics/package.json package.json
RUN npm install
COPY basics .
RUN npm run build

FROM oven/bun:1
WORKDIR /backend
COPY --from=build /basics/dist/basics/browser/ ./
COPY server.ts server.ts
EXPOSE 8156
CMD [ "bun", "server.ts" ]