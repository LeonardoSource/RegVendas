#!/bin/bash

# Registro de vendas e saidas

# Autor : Leonardo Araujo  ***  lcostaaraujo9@gmail.com
# https://github.com/leonardosource

# Configuração inicial
WORK_DIR="$HOME/RegVendas"
ARQ="$WORK_DIR/$(date +%F).txt"

[[ ! -d "$WORK_DIR" ]] && mkdir "$WORK_DIR"
[[ ! -e "$ARQ" ]] && touch "$ARQ"


# INICIO
while $(zenity --question --text "Continuar?") ; do

    echo $(zenity --width=400 --height=200 --forms --text "Produto e Preço" \
     --add-entry="Produto" --add-entry="Preço" --separator="   --   ") >> $ARQ

done
