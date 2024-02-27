FROM node:20 as build
WORKDIR /basics
COPY basics/package.json package.json
RUN npm install
COPY basics .
RUN npm run build

FROM httpd:2.4
COPY --from=build /basics/dist/basics/browser/ /usr/local/apache2/htdocs/