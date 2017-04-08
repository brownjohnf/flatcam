IMAGE=localhost/flatcam:latest

build:
	docker build -t ${IMAGE} .

shell: build
	docker run -it --rm \
		--entrypoint /bin/bash \
		${IMAGE}

run: build
	xhost local:docker # needed to allow access to X from inside the container
	docker run -it --rm \
		-e DISPLAY=unix${DISPLAY} \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-v /data/circuit_boards:/root/circuit_boards \
		${IMAGE}
