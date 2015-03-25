FROM quine:latest
MAINTAINER TSUYUSATO Kitsune <make.just.on@gmail.com>

# ユーザーをrootに戻す
USER root

# cmakeのインストール
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y cmake
ENV DEBIAN_FRONTEND interactive

# ユーザーを戻す
USER quine

# lciのインストール
RUN git clone https://github.com/justinmeza/lci.git $HOME/build/lci
RUN cd $HOME/build/lci                 && \
    cmake -DCMAKE_INSTALL_PREFIX=$HOME && \
    make                               && \
    make install
