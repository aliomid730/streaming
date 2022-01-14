FROM alpine:latest
MAINTAINER Sayyed Ali Agha Hashimi <ali.omid730@gmail.com>
RUN apk add --no-cache nginx nginx-mod-rtmp && mkdir -p /mnt/hls/live
COPY stream.conf /etc/nginx/modules/10_rtmp.conf
COPY cert.pem /etc/ssl/certs/cert.pem
COPY ca.pem /etc/ssl/certs/ca.pem
COPY key.pem /etc/ssl/private/key.pem
COPY default.conf /etc/nginx/http.d/default.conf
EXPOSE 80 443 1953
CMD ["nginx", "-g", "daemon off;"]
