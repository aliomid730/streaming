FROM alpine:latest
MAINTAINER Sayyed Ali Agha Hashimi <ali.omid730@gmail.com>
RUN apk add --no-cache nginx nginx-mod-rtmp && mkdir -p /mnt/hls/live && mkdir -p /var/www/localhost/htdocs/show
COPY stream.conf /etc/nginx/modules/10_rtmp.conf
COPY cert.pem /etc/ssl/certs/cert.pem
COPY ca.pem /etc/ssl/certs/ca.pem
COPY key.pem /etc/ssl/private/key.pem
COPY default.conf /etc/nginx/http.d/default.conf
COPY index.html /var/www/localhost/htdocs/show/
COPY playerjs.js /var/www/localhost/htdocs/show/
EXPOSE 80 443 1935
CMD ["nginx", "-g", "daemon off;"]
