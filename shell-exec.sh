#!/bin/bash
set -e
for arg in "$@"; do
  $arg
done
