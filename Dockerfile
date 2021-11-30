FROM python:3.7-slim


RUN \
	apt-get update && apt-get install -y \
	autoconf \
        automake \
	libtool \
	build-essential \
	unzip \
	git \
	wget


RUN \
 	wget -O boost_1_63_0.zip https://sourceforge.net/projects/boost/files/boost/1.63.0/boost_1_63_0.zip/download && \
 	unzip boost_1_63_0.zip && \
 	mv boost_1_63_0 /usr/local/bin && \
 	rm boost_1_63_0.zip


RUN \
	git clone https://github.com/facebookresearch/Starspace.git && \
	cd Starspace && \
	make
	

WORKDIR /Starspace


ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
USER user


CMD ["bash"]

