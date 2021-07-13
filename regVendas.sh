#!/bin/bash

# Registro de vendas e saidas

# Autor : Leonardo Araujo  ***  lcostaaraujo9@gmail.com
# https://github.com/leonardosource

# Configuração inicial
WORK_DIR="$HOME/RegVendas"
ARQ="$WORK_DIR/$(date +$U)_$(date +%F).txt"
TITLE="Vendas"

[[ ! -d "$WORK_DIR" ]] && mkdir "$WORK_DIR"
[[ ! -e "$ARQ" ]] && touch "$ARQ"

# Organiza os arquivos da semana
# adicionar suporte para se nao fechar no domingo
#[[  $(date +%A )-eq "domingo"  ]] && 'move aqui'

# INICIO

while : ; do

    SOMA=0
    form=$(zenity --width=400 --height=200 --forms --text "Produto e Preço" \
     --title="$TITLE" \
     --add-entry="Produto" --add-entry="Preço" --separator="  --   R$")

    if  [[ $form ]] ; then # Nao for vazio
        
        echo "[ $(date +%c) ] $form" >> $ARQ ;
        
    else
        case $(zenity --list --text "Fechamento" \
                --radiolist \
                --column "" \
                --column="EXIBIR" \
                FALSE "Total Semanal" \
                FALSE "Total do Dia" \
                FALSE "Total do Mês" \
                FALSE "Total Registrado" \
                FALSE "Última Venda") in
                
                "Total Semanal")
                
                        # Faz a soma de todos os arquivos fora das pastas
                        for  a in "$WORK_DIR/*" ; do
                            [[  ! -d $a ]] && SOMA=$(($(awk  -F 'R\\$' 'BEGIN {total=0} {total+=$2} END {print total}' $a)+$SOMA))
                        done;
                        
                        #exibe ao total
                        zenity --info --text="O Total Vendido ate o momento registrado neste programa e $SOMA" ;;
                        
                "Total do Dia")
                    ;;
                "Total do Mês")
                    ;;
                "Total  Registrado")
                    ;;
                "Última Venda")
                    ;;
               *)
                
                exit 0;
        esac
    fi

done
