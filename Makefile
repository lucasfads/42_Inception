build-nginx:
	docker build srcs/nginx/ -t nginx

run-nginx:
	docker run -d -p 443:443 nginx

build-mariadb:
	docker build srcs/mariadb/ -t mariadb

run-mariadb:
	docker run -d mariadb

solve-kill:
	sudo aa-remove-unknown

build:
	docker-compose -f ./srcs/docker-compose.yml up --build -d