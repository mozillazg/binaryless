
OUTPUT_TYPE ?= docker
IMAGE ?= ""

OS ?= linux
ARCH ?= amd64

ALL_OS = linux
ALL_ARCH.linux = amd64 arm arm64 ppc64le s390x
ALL_OS_ARCH.linux = $(foreach arch, ${ALL_ARCH.linux}, linux-$(arch))
ALL_OS_ARCH = $(foreach os, $(ALL_OS), ${ALL_OS_ARCH.${os}})

push-manifest:
	docker manifest create --amend $(IMAGE) $(shell echo $(ALL_OS_ARCH) | sed -e "s~[^ ]*~$(IMAGE)\-&~g")
	set -x; \
	for arch in $(ALL_ARCH.linux); do \
	    docker manifest annotate --os linux --arch $${arch} ${IMAGE} ${IMAGE}-linux-$${arch}; \
	done
	docker manifest push --purge ${IMAGE}:${TAG}

container: .container-${OS}-$(ARCH)
.container-linux-$(ARCH):
	docker buildx build --no-cache --pull --push --output=type=${OUTPUT_TYPE} --platform ${OS}/$(ARCH) \
		--tag $(IMAGE)-${OS}-$(ARCH) --build-arg BASE=${BASE} --build-arg ARCH=$(ARCH) .
