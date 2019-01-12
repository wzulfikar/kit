FROM alpine
WORKDIR /data

COPY ./bash ./kit/docker-dependencies/* /bin/

RUN source /bin/proxify.sh

RUN apk add --no-cache \
git \
bash \
curl \
entr \
file \
nano \
perl \
ffmpeg \
tesseract-ocr \
imagemagick imagemagick-dev
