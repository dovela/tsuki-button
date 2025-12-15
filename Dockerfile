# 多阶段构建，先编译前端，再用 Nginx 托管静态资源
FROM node:20-alpine AS builder
WORKDIR /app

COPY package*.json yarn.lock* ./
RUN npm ci

COPY . .
RUN npm run build

FROM nginx:1.27-alpine
WORKDIR /usr/share/nginx/html

RUN rm -rf ./* && mkdir -p /etc/nginx/ssl /etc/nginx/button_conf
COPY --from=builder /app/dist ./
COPY docker/nginx.conf /etc/nginx/button_conf/nginx.conf
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80
EXPOSE 443

CMD ["/entrypoint.sh"]
