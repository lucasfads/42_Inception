LOGIN = lucafern

solve-kill:
	sudo aa-remove-unknown

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

build:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

prune:
	docker system prune -a

# UTILS

mkcert-install:
	sh ./utils/install_mkcert.sh

mkcert-generate:
	mkcert $(LOGIN).42.fr
	mv $(LOGIN).42.fr-key.pem ./srcs/tools/$(LOGIN).42.fr.key
	mv $(LOGIN).42.fr.pem ./srcs/tools/$(LOGIN).42.fr.crt
	mkdir ./srcs/nginx/tools/
	cp ./srcs/tools/* ./srcs/nginx/tools/

.PHONY	: all build down re clean fclean



