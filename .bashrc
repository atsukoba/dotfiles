# ~/.bashrc file

## dir/finder
alias cdd="cd ~/Desktop"
alias cddd="cd ~/Documents"
alias up="cd ..; pwd; ls -l"
alias f="open ."

## open programs
alias jn="jupyter notebook"
alias jnb="jupyter notebook --no-browser"
alias jl="jupyter lab"
alias c="clear"
alias chrome="open -a Google\ Chrome"
alias md="open -a MacDown"
alias blog="cddd; cd blog/; code ."

# make frequentry made files
alias readme="touch readme.md; emacs readme.md"

alias ofcode="git clone https://github.com/hsab/ofVSCode.git && mv ./ofVSCode/.vscode/ ./ && mv ./ofVSCode/.gitignore ./ && mv -n ./ofVSCode/addons.make ./ && mv -n ./ofVSCode/config.make ./ && mv -n ./ofVSCode/Makefile ./ && mv -n ./ofVSCode/src/ ./ &&  rm -rf ./ofVSCode"

# change prompt settings 2018-08-9

# git extention
function parse_git_branch() {
  git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}
export PS1="\n\[\e[0;37m\][\#(\!)] \[\e[0;33m\]\t \[\e[0;34m\]\u \[\e[0;37m\]at \[\e[0;31m\]\w\[\e[0;37m\]\[\e[1;37m\]\$(parse_git_branch)\[\e[1;37m\]\n\[\e[0;36m\]--> \[\e[0m\]"
# export PS1="\n\[\e[0;37m\][\#(\!)] \[\e[0;33m\]\t \[\e[0;34m\]\u \[\e[0;37m\]on \[\e[0;35m\]\s\v \[\e[0;37m\]at \[\e[0;31m\]\h:\w \[\e[0;37m\]\n\[\e[1;37m\]\$(parse_git_branch)\[\e[1;37m\]\n\[\e[0;36m\]--> \[\e[0m\]"

# env var PATHes

## pathes for other cmds
PATH=/usr/local/bin:$PATH
PATH=/usr/local/sbin:$PATH

## pathes for pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

## pathes for NEURON.app 2018-08-11
export PATH="/Applications/NEURON-7.6/nrn/x86_64/bin":$PATH             #added by NEURON installer
export PYTHONPATH="/Applications/NEURON-7.6/nrn/lib/python":$PYTHONPATH #added by NEURON installer

## path for my shellscripts
export PATH="$HOME/Documents/shellscripts:$PATH"

# functions

# z() : easy/fuzzy jump dir added 2018-08-12
. $(brew --prefix)/etc/profile.d/z.sh
function precmd() {
  _z --add "$(pwd -P)"
}

## cleanup() : delete empty dir in working dir added 2018-08-12
cleanup() {
  find ./ -type d -maxdepth 2 -empty -exec rmdir -v {} \; 2>/dev/null
  find ./ -type d -maxdepth 2 -empty -exec rmdir -v {} \; 2>/dev/null
}

## dic() : dic stands for "dictionary", search eng words from Weblio via w3m command
dic() {
  w3m "http://ejje.weblio.jp/content/$1" | grep -e "主な意味" -e "用例"
}

# ruby/rails settings
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
export PATH="/usr/local/opt/libiconv/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/libiconv/lib"
export CPPFLAGS="-I/usr/local/opt/libiconv/include"

# GOPATH
export GOPATH=$HOME/.go
export PATH="$HOME/.go/bin:$PATH"
