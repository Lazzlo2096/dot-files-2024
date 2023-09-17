# https://jichu4n.com/posts/debug-trap-and-prompt_command-in-bash/

# to reload: source ~/dot-files-2024/.my.1.bashrc


save_command_0() {

    command="$1"
    start_time="$2"
    formatted_delta_time="$3"

    timestamp_=$(date -d@$start_time +%H:%M:%S)

    echo -ne "[$timestamp_ +$formatted_delta_time]\t$command\n" >> ~/.my_history
}

save_command() {

    command="$1"
    timestamp="$2"
    duration="$3"

    path=$(pwd) #"$4"
    terminal=$(tty) #"$5" 

    #timestamp=$(date +"%Y-%m-%d %H:%M:%S") # Текущая дата и время
    timestamp=$(date -d@$timestamp +"%Y-%m-%d %H:%M:%S")
    #echo lol=$timestamp

    echo "$timestamp | $duration | $terminal | '$path' | '$command'" >> ~/commands.log
}

# todo: hours or more minuts ?

# This will run before any command is executed.
function PreCommand() {
  if [ -z "$AT_PROMPT" ]; then
    return
  fi
  unset AT_PROMPT


  # Do stuff.
  start_time=$(date +%s)


  #echo "Running PreCommand"
}
trap "PreCommand" DEBUG


# This will run after the execution of the previous full command line.
FIRST_PROMPT=1
function PostCommand() {
  AT_PROMPT=1

  if [ -n "$FIRST_PROMPT" ]; then
    unset FIRST_PROMPT
    return
  fi


  # Do stuff.
  end_time=$(date +%s)
  duration=$((end_time - start_time))

  seconds=$(($duration%60))
  minutes=$(($duration/60))
  formatted_delta_time=$(printf "%02d:%02d" $minutes $seconds)

  if [[ $duration -gt 60 ]]; then

    #play -q -n synth 0.1 sin 400 || echo "Sound failed to play."

    #echo "Command started at: $(date -d@$start_time)"
    #echo "Command finished at: $(date -d@$end_time)"
    #echo "Command duration: $duration seconds"

    #echo -e "\t > started at $(date -d@$start_time +%H:%M:%S) [+$formatted_delta_time ($duration)] "
    echo -ne "[+$formatted_delta_time]"

  fi
  
  command=$(fc -ln -0)

  # минус того, что оно запишеться только после окончания, хз
  save_command_0 "$command" "$start_time" "$formatted_delta_time"
  
  save_command   "$command" "$start_time" "$duration"


  #echo "Running PostCommand"
}
PROMPT_COMMAND="PostCommand"

alias historymy=" tail ~/.my_history"
alias historymyfull=" cat ~/.my_history"
