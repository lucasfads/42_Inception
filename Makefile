build-nginx:
	docker build srcs/nginx/ -t nginx

run-nginx:
	docker run -d -p 443:443 nginx