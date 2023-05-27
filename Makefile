LOGIN = lucafern

# DOCKER

build:
	docker-compose -f ./srcs/docker-compose.yml up --build -d

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

prune:
	docker system prune -a --volumes

# UTILS

solve-kill:
	sudo aa-remove-unknown

solve-apparmor:
	sudo apparmor_parser -r /etc/apparmor.d/*snap-confine*
	sudo apparmor_parser -r /var/lib/snapd/apparmor/profiles/snap-confine*
	service snapd.apparmor start
	sudo apparmor_parser -r /var/lib/snapd/apparmor/profiles/*	

setup: mkcert-install mkcert-generate datadir

mkcert-install:
	sh ./srcs/utils/install_mkcert.sh

mkcert-generate:
	mkcert $(LOGIN).42.fr
	mv $(LOGIN).42.fr-key.pem ./srcs/utils/$(LOGIN).42.fr.key
	mv $(LOGIN).42.fr.pem ./srcs/utils/$(LOGIN).42.fr.crt
	mkdir ./srcs/nginx/utils/
	cp ./srcs/utils/* ./srcs/nginx/tools/

datadir:
	chmod +x srcs/wordpress/tools/make_dir.sh
	srcs/wordpress/tools/make_dir.sh

.PHONY	: all build down re clean fclean



