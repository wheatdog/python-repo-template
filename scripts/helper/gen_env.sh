#!/usr/bin/env bash

conda env export | grep -v "^prefix: " > environment.yml
