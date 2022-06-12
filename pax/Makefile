.PHONY: d-up
d-up:
	docker-compose up -d --no-recreate

.PHONY: d-down
d-down:
	docker-compose down

.PHONY: d-restart
d-restart: d-down d-up

.PHONY: ecto-create
ecto-create:
	mix ecto.create

.PHONY: up
up: d-up ecto-create
	mix phx.server
