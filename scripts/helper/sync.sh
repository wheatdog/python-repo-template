#!/usr/bin/env bash

cd $(dirname $0)

HOST=cml-lyt

expup \
    --local-base "$LOCAL" \
    --remote-base "$REMOTE" \
    --host "$HOST" \
    --name dummy \
    sync $@
