FROM ubuntu:16.04

LABEL maintainer="Enrico Gaffo <enrico.gaffo@gmail.com>"

############################################################
# Software: 		CirComPara
# Software Version: 	0.6.1a
# Software Website: 	https://github.com/egaffo/CirComPara
# Description: 		CirComPara
############################################################

ARG INSTALL_THREADS=2

ENV APP_NAME=CirComPara
ENV VERSION=v0.6.1a
ENV GIT=https://github.com/egaffo/CirComPara.git
ENV DEST=/software/applications/$APP_NAME/
ENV PATH=$DEST/$VERSION/:$DEST/$VERSION/scripts/:$PATH
ENV PACKS /packs

RUN add-apt-repository ppa:ubuntugis/ubuntugis-unstable && \
    apt-get update && \
    apt-get install -y \
	python2.7 \
	python-pip \
	python-numpy \
	zlib1g-dev \
	unzip \
	pkg-config \
	libncurses5-dev \
	default-jre \
	r-base-core \
	libcurl4-openssl-dev \
	libxml2-dev \
	libssl-dev \
	libcairo2-dev \
	pandoc \
	cargo \
	libgdal-dev \
	git \
	wget \
	libnlopt-dev \
	curl \
    && pip install --upgrade pip \
    && git clone $GIT  \
    && cd $APP_NAME \
    && git checkout tags/$VERSION \
    && ./install_circompara -j${INSTALL_THREADS} \
    && rm -rf .git \
    && rm -rf tools/*.gz \
    && rm -rf tools/*.zip \
    && rm -rf tools/*.bz2 \
    && rm -rf /var/lib/apt/lists/* \
    && cd ../ 

WORKDIR /data

ENTRYPOINT ["/CirComPara/circompara"]
