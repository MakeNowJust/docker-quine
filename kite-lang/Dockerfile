FROM quine:latest
MAINTAINER TSUYUSATO Kitsune <make.just.on@gmail.com>

# ユーザーをrootに戻す
USER root

# haskell-platformとnodejsのインストール
ENV DEBIAN_FRONTEND noninteractive
RUN curl -sL https://deb.nodesource.com/setup | sudo bash -
RUN apt-get install -y haskell-platform nodejs
ENV DEBIAN_FRONTEND interactive

# kiteのインストール
RUN git clone https://github.com/kite-lang/kite.git /tmp/kite
RUN cabal update
RUN cd /tmp/kite            && \
    (cabal install || true) && \
    make                    && \
    make install

# ユーザーを戻す
USER quine
