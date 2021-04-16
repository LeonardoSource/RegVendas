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
    form=$(zenity --title "Controle de Vendas" --width=400 --height=200 --forms --text "Produto e Preço" \
     --add-entry="Produto" --add-entry="Preço" --separator="   --   ") ;
    
    if  [[ $form ]] ; then # Nao for vazio
        echo $form >> $ARQ ;
        elif [[ $(zenity --list --text "Fechamento" \
					--checklist \
					--column "" \
					--column="Ação" \
					FALSE "Exibir Resumo") ]] ; then 
        zenity --info --text="AQUI vem o resumo" ; else
        exit 0;
    fi
        
done
# Remover linhas duplicadas nos arquivos de registro
