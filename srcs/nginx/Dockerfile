FROM	alpine:3.17

RUN		apk update && apk upgrade && apk add --no-cache nginx

EXPOSE	80

EXPOSE	443

ENTRYPOINT	["nginx", "-g", "daemon off;"]
