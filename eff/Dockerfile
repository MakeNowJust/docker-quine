FROM quine:latest
MAINTAINER TSUYUSATO Kitsune <make.just.on@gmail.com>

# ユーザーをrootに戻す
USER root

# ocamlbrewのインストール
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y curl m4
ENV DEBIAN_FRONTEND interactive
RUN curl -kL https://raw.github.com/hcarty/ocamlbrew/master/ocamlbrew-install | env OCAMLBREW_FLAGS="-r" bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# 依存ライブラリのインストール
RUN source $HOME/ocamlbrew/ocaml-*/etc/ocamlbrew.bashrc && opam install -y menhir

# effのインストール
RUN git clone https://github.com/matijapretnar/eff.git /tmp/eff
RUN source $HOME/ocamlbrew/ocaml-*/etc/ocamlbrew.bashrc && \
    cd /tmp/eff                                         && \
    ./configure                                         && \
    make                                                && \
    make install

# ユーザーをquineに戻す
USER quine
