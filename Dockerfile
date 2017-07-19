FROM ubuntu:16.04
MAINTAINER Enrico Gaffo <enrico.gaffo@gmail.com>

############################################################
# Software: 		CirComPara
# Software Version: 	0.1.4
# Software Website: 	https://github.com/egaffo/CirComPara
# Description: 		CirComPara
############################################################

ENV APP_NAME=CirComPara
ENV VERSION=v0.1.4
ENV GIT=https://github.com/egaffo/CirComPara.git
ENV DEST=/software/applications/$APP_NAME/
ENV PATH=$DEST/$VERSION/:$DEST/$VERSION/scripts/:$PATH
ENV INSTALL_THREADS=2

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
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

RUN git clone $GIT ; \
    cd $APP_NAME ; \
    git checkout tags/$VERSION ; \
    ./install_circompara -j $INSTALL_THREADS ;\
    rm -rf .git ; \
    rm -rf tools/*.gz ; \
    rm -rf tools/*.zip ; \
    rm -rf tools/*.bz2 ; \
    cd ../ ;

## test the installation
#RUN cd $APP_NAME ; \
#    tar xf test_circompara.tar.gz ; \
#    cd test_circompara ; \
#    sed "s@\$CIRCOMPARA@/CirComPara@g" vars.py > analysis/vars.py ; \
#    sed "s@\$CIRCOMPARA@/CirComPara@g" meta.csv > analysis/meta.csv ; \
#    cd analysis/ ; \
#    ../../circompara -j $INSTALL_THREADS


CMD ["/bin/bash"]
ENTRYPOINT ["/bin/bash", "/$APP_NAME/circompara"]
