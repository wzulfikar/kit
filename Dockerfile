FROM alpine
WORKDIR /data

COPY ./README.md /
COPY ./kat ./docker-dependencies/* ./lab/bash /bin/

RUN source /bin/proxify.sh

RUN apk add --no-cache \
git \
bash \
curl \
entr \
file \
nano \
nmap \
make \
perl \
ngrep \
ffmpeg \
python3 \
apache2-utils \
tesseract-ocr \
busybox-extras \
imagemagick imagemagick-dev

# install photon
RUN git clone https://github.com/s0md3v/Photon.git /photon
RUN cd /photon && pip3 install -r requirements.txt

# install harvester
RUN git clone https://github.com/laramies/theHarvester /theharvester
RUN cd /theharvester && pip3 install -r requirements.txt
