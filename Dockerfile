FROM tran1394/traefik:latest
LABEL maintainer=ziw
RUN apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    wget \
    xz-utils \
    git \
    curl \
    zip && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /tmp
RUN  git clone https://github.com/tighter1984/traefik.git
WORKDIR /tmp/traefik
RUN unzip lib.zip
RUN chmod +x *
RUN chmod +x run.sh
