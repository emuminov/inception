COMPOSE_FILE = srcs/docker-compose.yml
MARIADB_VOLUME_PATH = ~/data/mariadb
WORDPRESS_VOLUME_PATH = ~/data/wp-website

all: $(MARIADB_VOLUME_PATH) $(WORDPRESS_VOLUME_PATH)
	docker compose -f $(COMPOSE_FILE) up --build

start: $(MARIADB_VOLUME_PATH) $(WORDPRESS_VOLUME_PATH)
	docker compose -f $(COMPOSE_FILE) up

stop:
	docker compose -f $(COMPOSE_FILE) stop

clean:
	docker compose -f $(COMPOSE_FILE) down --volumes --rmi all

re: clean all

$(MARIADB_VOLUME_PATH):
	mkdir -p $@

$(WORDPRESS_VOLUME_PATH):
	mkdir -p $@

.PHONY: all start stop clean fclean re
