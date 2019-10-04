prompt() {

  local question=$1
  local default=$2
  local var=$3
  local allowBlank=$4

  if [[ -n "${!var}" ]]; then
    echo "$question: ${!var}"
  else
    if [[ -t 1 ]]; then
      echo "$question [${var}=${default}]:"
      read answer
      if [[ -z "$answer" ]]; then
        if [[ -z "$default" && "$allowBlank" != "true" ]]; then
          echo "must set value"
          exit 1
        fi
        eval "$var=$default"
      else
        eval "$var='$answer'"
      fi
    else
      eval "$var=$default"
    fi
  fi


}
