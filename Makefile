DOCKER_COMPOSE_PATH	= srcs/docker-compose.yml
DOCKER_COMPOSE		= docker compose -f $(DOCKER_COMPOSE_PATH)

include srcs/.env

.PHONY: all
all: $(WORDPRESS_VOLUME_PATH) $(MARIADB_VOLUME_PATH)
	$(MAKE) up

.PHONY: up
up: $(WORDPRESS_VOLUME_PATH) $(MARIADB_VOLUME_PATH)
	$(DOCKER_COMPOSE) up --build

.PHONY: down
down:
	$(DOCKER_COMPOSE) down

.PHONY: stop
stop:
	$(DOCKER_COMPOSE) stop

.PHONY: restart
restart:
	$(DOCKER_COMPOSE) restart

.PHONY: clean
clean:
	$(DOCKER_COMPOSE) down --volumes --rmi all

.PHONY: fclean
fclean: clean
	rm -rf $(WORDPRESS_VOLUME_PATH) $(MARIADB_VOLUME_PATH)

.PHONY: re
re: fclean
	$(MAKE) all

$(WORDPRESS_VOLUME_PATH):
	mkdir -p $(WORDPRESS_VOLUME_PATH)

$(MARIADB_VOLUME_PATH):
	mkdir -p $(MARIADB_VOLUME_PATH)