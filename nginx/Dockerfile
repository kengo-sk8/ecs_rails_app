FROM nginx:latest

RUN apt-get update && apt-get install -y curl
RUN rm /etc/nginx/conf.d/default.conf

COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
