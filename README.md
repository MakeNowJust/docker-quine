# quine-docker

Quineを書くためのDockerfileです。完全に私用のために作っています。


## 機能

  - ビルドのために必要なもの色々インストール済み
  - [dotfiles2](https://github.com/MakeNowJust/dotfiles2)設定済み。


## インストール

```console
$ sudo docker build -t quine .
$ sudo docker run -i -t --name quine quine
```


## ライセンス

<https://makenowjust.github.io/license/mit?2015>
