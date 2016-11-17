#!/bin/bash

# Script para gerar Cartões de Crédito Validos.
# SSH TLS
# Raphael Frajuca


# Esse Script Utiliza Outro Script Feito por MIM Usando o baluhn para calcular o digito verificador.
separator=$3
bin=$(echo $1 | awk -F "x" '{print $1}')
echo $bin > /etc/ccgen/bin.beta
seq 1 $2 > /etc/ccgen/limite.beta
while read limite
do
while read inn
do
cc=$(($RANDOM % 10))$(($RANDOM % 10))$(($RANDOM % 10))$(($RANDOM % 10))$(($RANDOM % 10))$(($RANDOM % 10))$(($RANDOM % 10))$(($RANDOM % 10))$(($RANDOM % 10))
numerogen=$2
seq=$(seq 1 $numerogen)
limite2=$(seq 1 $limite)
echo $inn$cc$(python /etc/ccgen/gen.py $inn$cc)"$separator"$((($RANDOM % 10) + 3))"$separator"20$(shuf -i17-22 -n1)"$separator"$(($RANDOM % 10))$(($RANDOM % 10))$(($RANDOM % 10)) | awk '{print }'
done < /etc/ccgen/bin.beta
done < /etc/ccgen/limite.beta
