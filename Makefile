build-all: build build-no-tesseract

build:
	docker build \
		--build-arg http_proxy="${http_proxy}" \
		--build-arg HTTP_PROXY="${HTTP_PROXY}" \
		--build-arg https_proxy="${https_proxy}" \
		--build-arg HTTPS_PROXY="${HTTPS_PROXY}" \
		-t wzulfikar/kit \
		-f Dockerfile \
		.

build-no-tesseract:
	docker build \
		--build-arg http_proxy="${http_proxy}" \
		--build-arg HTTP_PROXY="${HTTP_PROXY}" \
		--build-arg https_proxy="${https_proxy}" \
		--build-arg HTTPS_PROXY="${HTTPS_PROXY}" \
		-t wzulfikar/kit:no-tesseract \
		-f Dockerfile-no-tesseract \
		.

push:
	docker push wzulfikar/kit

# synchronize lab with upstream
sync:
	cd lab && git pull && cd -
