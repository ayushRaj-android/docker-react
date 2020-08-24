FROM node:alpine as buildPhase
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx as runPhase
COPY --from=buildPhase /app/build /usr/share/nginx/html