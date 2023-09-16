# source^2 from : https://github.com/Lazzlo2096/my-another-configs/blob/main/rc_by_lazzlo2096.bash
#--------------------------------------------
# source from https://askubuntu.com/questions/730754/how-do-i-show-the-git-branch-with-colours-in-bash-prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# my tut pereorpedelyaem chto bylo v .bachrc
#if [ "$color_prompt" = yes ]; then
#if [ ! -z "$WSL_DISTRO_NAME" ]; then         # чтобы работало с цветами в WSL
if [ true ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ ' # without branch
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\n\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ ' # with branch, on new line
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\n\$ ' # with branch, on prev line
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n$(parse_git_branch)\$ ' # without colors
fi
#--------------------------------------------

# . "$HOME/.cargo/env" # auto added by cargo

s () { # s combinator
   
   #echo "Parameter #1 is $1"
   #echo "Parameter #2 is $2"
   #echo "Parameter #2 is $2"
   
   echo "$1 $3; $2 $3"
   #eval "$1 $3 ; $2 $3"
}

# пример использования 
# s mkdir cd new_folder
# s new_folder mkdir cd # и до безконечности хз...
# s new_folder /\ mkdir -r /\ cd -d # TODO: типа нужно чтобы флаги не съедал!
