FROM vectorface/php5.2
MAINTAINER TSUYUSATO Kitsune <make.just.on@gmail.com>

ENV HOME /root
WORKDIR $HOME

# curl、vimのインストール
RUN apt-get update
RUN apt-get install -y vim-nox curl

# flogscriptを落としておく
RUN cd $HOME && \
    curl -LO https://raw.githubusercontent.com/shinh/ags/master/be/fetcher/FlogScript.php

# start時にbashを起動
CMD ["/bin/bash"]
