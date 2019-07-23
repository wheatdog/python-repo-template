#!/usr/bin/env bash

source setting.sh

HOST=$(echo ${POSSIBLE_HOSTS} | tr ',' '\n' | fzf --layout reverse --height 5) || exit
SCRIPT_FILE=$(find ${LOCAL}/scripts/ -maxdepth 1 -type f | xargs realpath --relative-to=${LOCAL} | fzf --layout reverse --height 5) || exit
NAME=$(date +%F.%H-%M-%S).$HOST

_expup() {
    expup \
        --local-base "$LOCAL" \
        --remote-base "$REMOTE" \
        --host "$HOST" \
        --name "$NAME" \
        $@
}

_expup up
_expup exp \
    --tmux-session "$TMUX_SESSION" \
    --script-file "$SCRIPT_FILE"

echo $NAME
