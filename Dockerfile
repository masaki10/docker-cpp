FROM ubuntu:18.04

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y sudo && \
    apt-get install -y build-essential && \
    apt-get install -y vim && \
    apt-get install -y wget && \
    apt-get install -y unzip && \
    apt-get install -y git && \
    apt-get install -y libssl-dev

# コンパイラーのインストール
RUN apt-get install -y gcc && \
    apt-get install -y g++

# コンパイラーのパスをセット
ENV CC=/usr/bin/gcc \
    CXX=/usr/bin/g++

# CMakeインストール
RUN cd $HOME && \
    wget https://github.com/Kitware/CMake/releases/download/v3.17.1/cmake-3.17.1.tar.gz && \
    tar zxvf cmake-3.17.1.tar.gz && \
    cd cmake-3.17.1/ && \
    ./bootstrap && \
    make -j12 && sudo make install -j8
RUN echo 'export PATH=$HOME/cmake-3.17.1/bin/:$PATH' >> ~/.bashrc && \
    . ~/.bashrc

RUN apt-get install -y libopenblas-dev && \
    apt-get install -y liblapack-dev

# ライブラリインストール用ディレクトリ
WORKDIR $HOME/usr/
RUN mkdir ./library

CMD bash