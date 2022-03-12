#!/usr/bin/env bash

set -euo pipefail

echo "Deleting cache..."
rm -f ./autoload/nightowl2/palette.json

echo "Generating palette cache..."
nvim --headless '+call nightowl2#palette#dump("./autoload/nightowl2/palette.json")' \
                '+q!'

