FROM ubuntu:14.04

# Remove annoying messages from console output
ENV DEBIAN_FRONTEND=noninteractive

# Install packages (includes cross compiler) 
RUN apt-get update --fix-missing && apt-get upgrade -y -qq \
&& apt-get install -y -qq git python build-essential realpath libxml2-utils \
python-tempita ncurses-dev gcc-multilib software-properties-common curl \
libxml2

RUN add-apt-repository universe \
&& apt-get update \
&& apt-get install -y -qq gcc-arm-linux-gnueabi qemu-system-arm qemu-system-x86

# get Google Repo
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo && chmod a+x /bin/repo

# get seL4test
RUN mkdir /seL4test && cd /seL4test \
&& repo init -u https://github.com/seL4/sel4test-manifest.git \
&& repo sync

# set work dir
WORKDIR /seL4test

# reset to correct value
ENV DEBIAN_FRONTEND=newt
