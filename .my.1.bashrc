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
  if [[ $duration -gt 30 ]]; then
    play -q -n synth 0.1 sin 400 || echo "Sound failed to play."
    echo "Command started at: $(date -d@$start_time)"
    echo "Command finished at: $(date -d@$end_time)"
    echo "Command duration: $duration seconds"
  fi

  
  #echo "Running PostCommand"
}
PROMPT_COMMAND="PostCommand"
