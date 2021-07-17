#!/bin/zsh -x

anyenv init
anyenv install --force-init

if [ ! -d $(anyenv root)/plugins ]; then
  mkdir -p $(anyenv root)/plugins
  git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
fi

anyenv install -s rbenv &
anyenv install -s nodenv &
anyenv install -s pyenv &
wait

exec $SHELL -l <<EOF

rbenv  install -s 3.0.2 &
nodenv install -s 16.5.0 &
pyenv  install -s 3.9.6 &
wait

rbenv  global 3.0.2
nodenv global 16.5.0
pyenv  global 3.9.6

anyenv versions

EOF

# rbenv  install -l | grep -E '^ *[0-9]+\.[0-9]+\.[0-9]+$' | tail -n 3 | awk '{print $1}'
# nodenv install -l | grep -E '^ *[0-9]+\.[0-9]+\.[0-9]+$' | tail -n 3 | awk '{print $1}'
# pyenv  install -l | grep -E '^ *[0-9]+\.[0-9]+\.[0-9]+$' | tail -n 3 | awk '{print $1}'
