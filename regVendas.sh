#!/bin/bash

# Registro de vendas e saidas

# Autor : Leonardo Araujo  ***  lcostaaraujo9@gmail.com
# https://github.com/leonardosource

# Configuração inicial
WORK_DIR="$HOME/RegVendas"
ARQ="$WORK_DIR/$(date +%F).txt"
TITLE="Vendas"
SOMA=0

[[ ! -d "$WORK_DIR" ]] && mkdir "$WORK_DIR"
[[ ! -e "$ARQ" ]] && touch "$ARQ"

# Organiza os arquivos da semana
# adicionar suporte para se nao fechar no domingo
#[[  $(date +%A )-eq "domingo"  ]] && 'move aqui'

# INICIO

while : ; do

    form=$(zenity --width=400 --height=200 --forms --text "Produto e Preço" \
     --title="$TITLE" \
     --add-entry="Produto" --add-entry="Preço" --separator="  --   R$")

    if  [[ $form ]] ; then # Nao for vazio
        echo "[ $(date +%c) ] $form" >> $ARQ ;
        elif [[ $(zenity --list --text "Fechamento" \
					--checklist \
					--column "" \
					--column="Ação" \
					FALSE "Exibir Total ") ]] ; then
        
        # Faz a soma de todos os arquivos fora das pastas
        for  a in "$WORK_DIR/*" ; do
            [[  ! -d $a ]] && SOMA=$(($(awk  -F 'R\\$' 'BEGIN {total=0} {total+=$2} END {print total}' $a)+$SOMA))
        done;
        
        #exibe ao total
        zenity --info --text="O Total Vendido ate o momento registrado neste programa e $SOMA" ; else
        
        exit 0;
    fi

done
