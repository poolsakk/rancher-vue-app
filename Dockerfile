# Stage 1 Build App
FROM node:8.11-alpine

WORKDIR /app

COPY package.json /app

RUN npm install npm@latest -g && npm install -g @vue/cli-init && npm install 

COPY . /app

RUN npm run build

CMD ["npm", "run", "serve"]

EXPOSE 8080

# Stage 2 Nginx
# FROM nginx:alpine

# COPY --from=build /app/dist /usr/share/nginx/html

# EXPOSE 80