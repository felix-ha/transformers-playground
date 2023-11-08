.PHONY: build
build:
	nvidia-docker compose build python-server

.PHONY: run
run:
	docker compose up -d python-server

.PHONY: stop
stop:
	docker compose down


.PHONY: docker_build
docker_build:
	nvidia-docker build -t python-server . 

.PHONY: docker_run
docker_run:
	nvidia-docker run -dt -p 5000:5000 -e PYTHONUNBUFFERED=1 --name python-server python-server