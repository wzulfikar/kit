build-all: build build-no-tesseract

build:
	docker build --build-arg http_proxy="${http_proxy}" -t wzulfikar/kit -f Dockerfile lab

build-no-tesseract:
	docker build --build-arg http_proxy="${http_proxy}" -t wzulfikar/kit:no-tesseract -f Dockerfile-no-tesseract lab

push:
	docker push wzulfikar/kit

# synchronize lab with upstream
sync:
	cd lab && git pull && cd -
