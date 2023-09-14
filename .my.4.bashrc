#push_pwd() {
#    pwd >> /tmp/pwds_stack.txt
#}

#alias remember_pwd='push_pwd'

#alias show_pwd='cat /tmp/pwds_stack.txt'

#pop_pwd() {
#    if [ -s /tmp/pwds_stack.txt ]; then
#        last_dir=$(tail -n 1 /tmp/pwds_stack.txt)
#        cd "$last_dir" || exit
#        sed -i '$ d' /tmp/pwds_stack.txt
#    else
#        echo "pwds_stack.txt is empty"
#    fi
#}

#if [ "$1" = "remember_pwd" ]; then
#    push_pwd
#elif [ "$1" = "pop_pwd" ]; then
#    pop_pwd
#else
#    echo "Usage: remember_pwd <command>"
#    echo "Commands:"
#    echo "  remember_pwd - Remember the current directory"
#    echo "  pop_pwd - Change directory to the last remembered directory"
#fi

# ---------------------

alias remember_pwd='pushd $(pwd)'