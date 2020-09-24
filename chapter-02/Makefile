# Image URL to use for building/pushing images
TAG ?= latest
IMG ?= gitopsbook/example-operator:${TAG}

# Build the docker image
docker-build:
	docker build . -t ${IMG}

# Push the docker image
docker-push:
	docker push ${IMG}
