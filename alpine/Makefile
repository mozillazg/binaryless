
IMAGE = ""
PLATFORM ?= "linux/amd64,linux/arm64,linux/arm/v7"
BUILDX_OPTS ?= "--no-cache --pull"

buildx:
	docker buildx build --tag $(IMAGE) --platform $(PLATFORM) $(BUILDX_OPTS) --push .
