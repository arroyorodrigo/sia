#!/bin/zsh
# Reempaqueta la carpeta workflow/ en sia.alfredworkflow
cd "$(dirname "$0")/workflow" && rm -f ../sia.alfredworkflow && zip -qr ../sia.alfredworkflow . -x '.*' && echo "sia.alfredworkflow generado"
