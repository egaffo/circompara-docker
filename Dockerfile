FROM ubuntu:16.04

LABEL maintainer="Enrico Gaffo <enrico.gaffo@gmail.com>"

############################################################
# Software: 		CirComPara
# Software Version: 	1.0
# Software Website: 	https://github.com/egaffo/CirComPara
# Description: 		CirComPara
############################################################

ARG INSTALL_THREADS=2

ENV APP_NAME=CirComPara
ENV VERSION=v1.0
ENV GIT=https://github.com/egaffo/CirComPara.git
ENV DEST=/software/applications/$APP_NAME/
ENV PATH=$DEST/$VERSION/:$DEST/$VERSION/scripts/:$PATH
ENV PACKS /packs

RUN echo "deb http://cloud.r-project.org/bin/linux/ubuntu xenial-cran35/" >> /etc/apt/sources.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ubuntugis/ubuntugis-unstable && \
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
	mesa-common-dev \
	libglu1-mesa-dev \
	freeglut3-dev \
	bwidget \
	libmagick++-dev \
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
    && sed -i "s_echo -e_echo_" src/ccp_collect_circrnas.scons \
    && sed -i "s_echo -e_echo_" src/ccp_circrna_linear_expression.py \
    && cd ../ 

WORKDIR /data

ENTRYPOINT ["/CirComPara/circompara"]
