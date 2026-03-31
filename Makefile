COMPOSE = docker compose
COMPOSE_FILE = ./docker-compose.yml

.PHONY: up down build restart logs ps

all : up

up:
	$(COMPOSE) -f $(COMPOSE_FILE) up --build -d
	python3 -m venv venv
	venv/bin/pip install -r dependencies.txt

down:
	$(COMPOSE) -f $(COMPOSE_FILE) down

clean : down
	docker rm -f ollama-server || true
	docker rmi -f ollama/ollama || true
	rm -rf venv
	rm -rf __pycache__

re: clean all

logs:
	docker compose logs -f

ps:
	docker compose ps

ls:
	docker volume ls