# ~/.bashrc file
# aliases last edit [2018-08-12 7:01]

## dir/finder
alias cdd="cd ~/Desktop"
alias cddd="cd ~/Documents"
alias up="cd ..; pwd; ls -l"
alias f="open ."

## ssh
alias gpgpu1="ssh t16366ak@gpgpu01.sfc.keio.ac.jp"
alias gpgpu2="ssh t16366ak@gpgpu02.sfc.keio.ac.jp"
alias gpgpu3="ssh t16366ak@gpgpu03.sfc.keio.ac.jp"
alias cortex="ssh atsuya@cortex.sfc.keio.ac.jp"

## open programs
alias jn="jupyter notebook"
alias jnb="jupyter notebook --no-browser"
alias vim="open -a Atom"
alias openatom="open -a Atom"
alias chrome="open -a Google\ Chrome"
alias md="open -a MacDown"

# make frequentry made files
alias readme="touch readme.md; open -a Atom readme.md"

# change prompt settings 2018-08-9

export PS1="\n\[\e[0;37m\][\#(\!)] \[\e[0;33m\]\t \[\e[0;34m\]\u \[\e[0;37m\]on \[\e[0;35m\]\s\v \[\e[0;37m\]at \[\e[0;31m\]\w \[\e[0;37m\]\n\[\e[0;36m\]--> \[\e[0m\]"

# env var PATHes

## pathes for pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

## pathes for NEURON.app 2018-08-11
export PATH="/Applications/NEURON-7.6/nrn/x86_64/bin":$PATH #added by NEURON installer
export PYTHONPATH="/Applications/NEURON-7.6/nrn/lib/python":$PYTHONPATH #added by NEURON installer

## path for my shellscripts
export PATH="$HOME/Documents/shellscripts:$PATH"

# functions

## z() : easy/fuzzy jump dir added 2018-08-12
. `brew --prefix`/etc/profile.d/z.sh
    function precmd () {
    _z --add "$(pwd -P)"
}

## cleanup() : delete empty dir in working dir added 2018-08-12
cleanup () {
    find ./ -type d -maxdepth 2 -empty -exec rmdir -v {} \; 2>/dev/null
    find ./ -type d -maxdepth 2 -empty -exec rmdir -v {} \; 2>/dev/null
}

## dic() : dic stands for "dictionary", search eng words from Weblio via w3m command
dic (){
  w3m "http://ejje.weblio.jp/content/$1" | grep -e "主な意味" -e "用例"
}
