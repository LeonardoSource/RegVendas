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

while : ; do
    form=$(zenity --width=400 --height=200 --forms --text "Produto e Preço" \
     --add-entry="Produto" --add-entry="Preço" --separator="   --   ") ;
    
    if  [[ $form ]] ; then
        echo $form >> $ARQ
        elif [[ $(zenity --question --text "Já Vai ?" \
        --ok-label="Mostar Resumo" --cancel-label="SAIR") ]] ; then 
        zenity --info --text="AQUI vem o resumo" ; else # erro o cancel ou ok no q da no mesmoo
        exit 0;
    fi
        
done
