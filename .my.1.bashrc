# https://jichu4n.com/posts/debug-trap-and-prompt_command-in-bash/

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
  formatted_time=$(printf "%02d:%02d" $minutes $seconds)

  if [[ $duration -gt 60 ]]; then

    #play -q -n synth 0.1 sin 400 || echo "Sound failed to play."

    #echo "Command started at: $(date -d@$start_time)"
    #echo "Command finished at: $(date -d@$end_time)"
    #echo "Command duration: $duration seconds"

    #echo -e "\t > started at $(date -d@$start_time +%H:%M:%S) [+$formatted_time ($duration)] "
    echo -ne "[+$formatted_time]"

  fi
  
  command=$(fc -ln -0)
  echo -ne "[$(date -d@$start_time +%H:%M:%S) +$formatted_time]\t$command\n" >> ~/.my_history

  #echo "Running PostCommand"
}
PROMPT_COMMAND="PostCommand"

alias historymy=" tail ~/.my_history"
alias historymyfull=" cat ~/.my_history"
