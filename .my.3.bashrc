# source^2 from : https://github.com/Lazzlo2096/my-another-configs/blob/main/rc_by_lazzlo2096.bash
#--------------------------------------------
# source from https://askubuntu.com/questions/730754/how-do-i-show-the-git-branch-with-colours-in-bash-prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
	
	# git branch --show-current
	
	# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh#L38 # read more here
	#export GIT_PS1_SHOWDIRTYSTATE=true
	#export GIT_PS1_SHOWUNTRACKEDFILES=true
	# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh#L346 # read more here
	#$(__git_ps1)
}

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

#----------------------

MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[038;5;154m\]"
BLUE="\[\033[038;5;33m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[038;5;51m\]"
GREEN="\[\033[00;32m\]"
RED="\[\033[38;5;160m\]"
VIOLET="\[\033[01;35m\]"
GREY="\[\033[038;5;234m\]"
BROWN="\[\033[038;5;130m\]"
ORANGE="\[\033[038;5;208m\]"


# https://stackoverflow.com/questions/10466749/bash-colored-output-with-a-variable
RESTORE='\033[0m'

RED='\033[00;31m'
GREEN='\033[00;32m'
YELLOW='\033[00;33m'
BLUE='\033[00;34m'
PURPLE='\033[00;35m'
CYAN='\033[00;36m'
LIGHTGRAY='\033[00;37m'

LRED='\033[01;31m'
LGREEN='\033[01;32m'
LYELLOW='\033[01;33m'
LBLUE='\033[01;34m'
LPURPLE='\033[01;35m'
LCYAN='\033[01;36m'
WHITE='\033[01;37m'

function __test_colors(){
  echo -e "${GREEN}Hello ${CYAN}THERE${RESTORE} Restored here ${LCYAN}HELLO again ${RED} Red socks aren't sexy ${BLUE} neither are blue ${RESTORE} "
}

function __test_colors_pause(){
  echo -en "${CYAN}"
  read -p "[Paused]  $*" FOO_discarded
  echo -en "${RESTORE}"
}

#__test_colors
#__test_colors_pause

# ----------------------
# colors for PS1:
# https://unix.stackexchange.com/questions/140610/using-variables-to-store-terminal-color-codes-for-ps1

GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
RESET="$(tput setaf 0)"
#OR
GREEN="$(echo -e "\033[32m")"
YELLOW="$(echo -e "\033[33m")"
RESET="$(echo -e "\033[0m")"


LGREEN="$(echo -e "\033[01;32m")" # \[\033[01;32m\] # ${LGREEN}
RESET="$(echo -e "\033[00m")" # \[\033[00m\] # ${RESET}
LBLUE="$(echo -e "\033[01;34m")" # \[\033[01;34m\] # ${LBLUE}
LRED="$(echo -e "\033[01;31m")" # \[\033[01;31m\] # ${LRED}
#----------------------

# my tut pereorpedelyaem chto bylo v .bachrc
#if [ "$color_prompt" = yes ]; then
#if [ ! -z "$WSL_DISTRO_NAME" ]; then         # чтобы работало с цветами в WSL
if [ true ]; then
    #PS1='${debian_chroot:+($debian_chroot)}${LGREEN}\u@\h${RESET}:${LBLUE}\w${RESET}\n\$ ' # without branch
    #PS1='${debian_chroot:+($debian_chroot)}${LGREEN}\u@\h${RESET}:${LBLUE}\w\n${LRED}$(parse_git_branch)${RESET}\$ ' # with branch, on new line
    PS1='${debian_chroot:+($debian_chroot)}${LGREEN}\u@\h${RESET}:${LBLUE}\w${LRED}$(__git_ps1)${RESET}\n\$ ' # with branch, on prev line
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n$(parse_git_branch)\$ ' # without colors
fi
#--------------------------------------------

# . "$HOME/.cargo/env" # auto added by cargo

# но можно же просто заюзать переменную...лол...
# хотя, когда быстро хочеться сделать mkdir cd
s () { # s combinator
   
   echo "Parameter #1 is $1"
   echo "Parameter #2 is $2"
   echo "Parameter #2 is $2"
   
   echo "$1 $3 && $2 $3"
   #eval "$1 $3 ; $2 $3"
}

alias ','='s'

alias 'mkcd'='mkdir "@" && cd "@"'
alias 'mkcd2'='echo "@" && echo "@"'

mkdircd () {
  #echo "Parameter #1 is $1"
  #echo "Parameter #2 is $2"
  echo "Parameter #a is $@"

  # Сначала определите количество аргументов в списке
  num_args=$#
  echo $num_args
  tmp2=$((num_args-1))
  echo $tmp2


  # https://stackoverflow.com/questions/1335815/how-to-slice-an-array-in-bash
  
  ARGS=( "$@" )
  ARGS_AFTER_FIRST=( "${ARGS[@]:1:2}" )



  # Используйте срез, чтобы взять все элементы, кроме последнего
  all_but_last_args=("${@:2:4}")
  echo "Parameter #all_but_last_args is $ARGS_AFTER_FIRST"

  #mkdir $1
  #cd $1
}

# пример использования 
# s mkdir cd new_folder
# s new_folder mkdir cd # и до безконечности хз...
# s new_folder /\ mkdir -r /\ cd -d # TODO: типа нужно чтобы флаги не съедал!
