#!/bin/bash

# Build the current project
function xb() {
  : "${PUNKT_CMD_BUILD:?must be set}"
  eval "${PUNKT_CMD_BUILD} ${@}"
}

# Run a command in an execution environment for the current project
function xr() {
  : "${PUNKT_CMD_RUN:?must be set}"
  eval "${PUNKT_CMD_RUN} ${@}"
}

# Run a server for the current project
function xs() {
  : "${PUNKT_CMD_SERVE:?must be set}"
  eval "${PUNKT_CMD_SERVE} ${@}"
}
