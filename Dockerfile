FROM alpine
WORKDIR /data

COPY ./README.md /
COPY ./kat ./docker-dependencies/* ./lab/bash /bin/

RUN source /bin/proxify.sh

RUN apk --update add --no-cache \
git \
bash \
curl \
file \
nmap \
perl \
ngrep \
socat \
ffmpeg \
python3 \
apache2-utils \
busybox-extras \
tesseract-ocr \
imagemagick imagemagick-dev

# install photon
RUN git clone https://github.com/s0md3v/Photon.git /photon
RUN cd /photon && pip3 install --no-cache-dir -r requirements.txt

# install harvester (use the forked version)
RUN git clone https://github.com/wzulfikar/theHarvester /theharvester
RUN cd /theharvester && pip3 install --no-cache-dir -r requirements.txt

# internally, the `harvest` wrapper will run from /bin/. by default, 
# if `HARVESTER_WORDLISTS_DIR` not specified, theHarvester will 
# look for wordlists at its relative path (/bin/wordlists). this 
# will fail because the wordlists directory doesn't exist there.
# we installed theHarvester at /theharvester and hence, the default
# wordlists directory is available at /theharvester/wordlists.
# by specifying `HARVESTER_WORDLISTS_DIR`, we're able to call
# theHarvester from anywhere and it'll still be able to find
# the wordlists directory.
ENV HARVESTER_WORDLISTS_DIR=/theharvester/wordlists
