#!/usr/bin/env bash

set -e

echo
echo ================================================================================
echo
cat $0
echo
echo ================================================================================
echo

function stop() {
    echo -n "Stop at $(date +%F.%H-%M-%S). [R]emove $(pwd), [Enter] Do nothing: "
    while read c; do
        case $c in
            r|R) rm -rf $(pwd); break ;;
            *) echo "Do nothing."; break ;;
        esac
    done
}

trap stop EXIT


source $(conda info --base)/etc/profile.d/conda.sh

conda env update -f environment.yml
CONDA_ENV_NAME=$(grep "name:" environment.yml | cut -d' ' -f2)
conda activate ${CONDA_ENV_NAME}
unset CONDA_ENV_NAME
