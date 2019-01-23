UID=$(shell id -u)
GID=$(shell id -g)

app/start: ## Start application services for current environment
app/start: docker/build
	docker-compose up -d

app/stop: ## Stop application services
	@docker-compose down --remove-orphans

docker/build: ## (Re)build docker images for services in the current environment
	docker-compose build \
		--build-arg GID=${GID} \
		--build-arg UID=${UID}

docker/bash: ## Start `bash` in the  docker container
docker/bash:
	docker-compose exec ssh-tunel bash

