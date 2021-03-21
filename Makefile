REPO=meemoocode
NAME=ampq2elastic
VERSION=$(shell (git describe --tags || echo latest))

compile:
	docker run --rm \
		-v cargo-cache:/root/.cargo \
		-v $$PWD:/volume \
		-w /volume \
		-it clux/muslrust:1.50.0-stable \
		cargo build --release
	sudo chown $$USER:$$USER -R target

build-image:
	docker build -f Dockerfile -t $(REPO)/$(NAME):$(VERSION) .
	
run-container:
	docker run --rm --network amqp2elastic-network --env-file .env $(REPO)/$(NAME):$(VERSION)

.PHONY: build-image run-container
