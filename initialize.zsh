#!/bin/zsh

if ! [[ -d $HOME/dotfiles ]]; then
  git clone --recursive https://github.com/MakeNowJust/dotfiles2.git $HOME/dotfiles
  (cd $HOME/dotfiles && ./install.bash)
else
  (cd $HOME/dotfiles && git pull -ff-only)
fi

if ! [[ -d $HOME/quine ]]; then
  git clone https://github.com/MakeNowJust/quine.git
else
  (cd $HOME/dotfiles && git pull -ff-only)
fi

exec zsh -i
