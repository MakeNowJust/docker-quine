FROM ubuntu:14.10
MAINTAINER TSUYUSATO Kitsune <make.just.on@gmail.com>

# aptのサーバーを日本から高速なミラーに設定
RUN sed -i".back" -e 's/\/\/archive.ubuntu.com/\/\/ftp.jaist.ac.jp\/pub\/Linux/g' /etc/apt/sources.list

# apt-get中に出る警告を防ぐ
ENV DEBIAN_FRONTEND noninteractive
# aptを更新&必要なソフトをインストール
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y           \
      git                        \
      vim-nox                    \
      build-essential            \
      man                        \
      curl                       \
      software-properties-common \
      zsh zsh-doc                \
      language-pack-ja
# 警告を戻す
ENV DEBIAN_FRONTEND interactive

# ユーザーquineを追加する
RUN useradd --create-home -s /bin/zsh quine && \
    adduser quine sudo                      && \
    echo "quine:quine" | chpasswd
# quineはパスワード無しでsudo可能
RUN echo "Defaults:quine !authenticate" | tee /etc/sudoers.d/quine

# 言語の日本語に設定
ENV LANG ja_JP.UTF-8
RUN update-locale

# タイムゾーンもAsia/Tokyoに設定
RUN echo "Asia/Tokyo" | tee /etc/timezone
RUN dpkg-reconfigure --frontend noninteractive tzdata

# ユーザーquineで、quineのホームディレクトリからスタート
USER quine
ENV HOME /home/quine
WORKDIR $HOME

# dotfilesを追加
RUN git clone --recursive https://github.com/MakeNowJust/dotfiles2 $HOME/dotfiles && \
    cd $HOME/dotfiles && ./install.bash

# quineを追加
RUN git clone https://github.com/MakeNowJust/quine $HOME/quine

# start時にzshを起動
ENV SHELL /bin/zsh
CMD ["/bin/zsh"]
