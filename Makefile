
ARCHS = amd64 arm arm64 ppc64le s390x
IMAGE =
DIR =

build-arch-image:
	set -x; \
	cd $(DIR) && \
	for arch in $(ARCHS); do \
	  IMAGE=$(IMAGE) ARCH=$${arch} make container
	done

push-manifest:
	set -x; \
	cd $(DIR) && \
	IMAGE=$(IMAGE) make push-manifest

test-arch-image:
	set -x; \
	for arch in $(ARCHS); do \
		ARCH_IMAGE=$(IMAGE)-linux-$${a} docker manifest inspect -v "$${ARCH_IMAGE}" | jq '.Descriptor.platform'
	done
