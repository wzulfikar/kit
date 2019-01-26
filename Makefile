CURRENT_DIR=$(shell pwd)

.PHONY: docker-dependencies

build:
	docker build \
		--build-arg http_proxy="${http_proxy}" \
		--build-arg HTTP_PROXY="${HTTP_PROXY}" \
		--build-arg https_proxy="${https_proxy}" \
		--build-arg HTTPS_PROXY="${HTTPS_PROXY}" \
		-t wzulfikar/kit \
		-f Dockerfile \
		.

docker-dependencies:
	# build ytdl
	cd ${GOPATH}/src/github.com/rylio/ytdl/cmd/ytdl && \
	GOOS=linux GOARCH=amd64 go build -o ${CURRENT_DIR}/docker-dependencies/ytdl .

push:
	docker push wzulfikar/kit

sync:
	# synchronize lab with upstream
	cd lab && git pull origin master && cd -
