FROM nvidia/cuda:8.0-cudnn6-runtime-centos7
RUN yum update -y \
&& yum install -y \
        https://centos7.iuscommunity.org/ius-release.rpm \
&& yum clean all \
&& rm -rf /var/cache/yum

RUN yum install -y \
        build-essential \
        curl \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        rsync \
        software-properties-common \
        unzip \
        libcupti-dev \
        python36u \
        python36u-devel \
        python36u-pip \
        cuda-command-line-tools-8-0 \
#        libsm6 \
#        libxext6 \
#        libxrender-dev \ 
&& yum update -y \
&& yum clean all \
&& rm -rf /var/cache/yum
 
#RUN curl -O https://bootstrap.pypa.io/get-pip.py \
#&& python3.6 get-pip.py \
#&& rm get-pip.py

RUN ln -s /usr/bin/pip3.6 /usr/bin/pip
RUN rm /usr/bin/python && ln -s /usr/bin/python3.6 /usr/bin/python
RUN pip install --no-cache-dir -U ipython pip setuptools
RUN pip install --no-cache-dir tensorflow-gpu tensorflow
 
ENV LD_LIBRARY_PATH /usr/local/cuda-8.0/lib64:/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH
ENV CUDA_HOME /usr/local/cuda-8.0
 
# Install some dependencies that are needed
#RUN apt-get update && apt-get install -y libsm6 libxext6 libxrender-dev
