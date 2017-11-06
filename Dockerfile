FROM ubuntu:16.04

LABEL maintainer="Enrico Gaffo <enrico.gaffo@gmail.com>"

############################################################
# Software: 		CirComPara
# Software Version: 	0.2.1
# Software Website: 	https://github.com/egaffo/CirComPara
# Description: 		CirComPara
############################################################

ARG INSTALL_THREADS=2

ENV APP_NAME=CirComPara
ENV VERSION=v0.2.1
ENV GIT=https://github.com/egaffo/CirComPara.git
ENV DEST=/software/applications/$APP_NAME/
ENV PATH=$DEST/$VERSION/:$DEST/$VERSION/scripts/:$PATH


RUN apt-get update && apt-get install -y \
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
	git \
	wget \
	libnlopt-dev \
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
