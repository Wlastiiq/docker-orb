#!/usr/bin/env bash

if [[ $EUID == 0 ]]; then export SUDO=""; else export SUDO="sudo"; fi

if [ "$PARAM_DEBUG" = true ]; then
  npm install -g dockerlint || "$SUDO" npm install -g dockerlint
else
  npm install -g dockerlint > /dev/null 2>&1 || "$SUDO" npm install -g dockerlint > /dev/null 2>&1
fi

if [ "$PARAM_TREAT_WARNING_AS_ERRORS" = true ]; then
  dockerlint -f "$PARAM_DOCKERFILE" -p
else
  dockerlint -f "$PARAM_DOCKERFILE"
fi