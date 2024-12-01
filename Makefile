COMPOSE_FILE = docker-compose.yml
MARIADB_VOLUME_PATH = ~/data/mariadb
WORDPRESS_VOLUME_PATH = ~/data/website

all: $(MARIADB_VOLUME_PATH) $(WORDPRESS_VOLUME_PATH)
	docker compose -f $(COMPOSE_FILE) up --build

start: $(MARIADB_VOLUME_PATH) $(WORDPRESS_VOLUME_PATH)
	docker compose -f $(COMPOSE_FILE) up

stop:
	docker compose -f $(COMPOSE_FILE) stop

clean:
	docker compose -f $(COMPOSE_FILE) down --volumes --remove-orphans
	docker system prune --all --volumes --force

fclean: clean
	rm -rf $(MARIADB_VOLUME_PATH)
	rm -rf $(WORDPRESS_VOLUME_PATH)

re: fclean all

$(MARIADB_VOLUME_PATH):
	mkdir -p $@

$(WORDPRESS_VOLUME_PATH):
	mkdir -p $@

.PHONY: all start stop clean fclean re
