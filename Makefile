# simple makefile to build and push docker container images
IMAGE_NAME = sebastianhutter/drone-agent

build: build_latest push_latest

build_latest:
	docker build -t $(IMAGE_NAME):latest .

# push the build containers
push_latest: 
	docker push $(IMAGE_NAME):latest

