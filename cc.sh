#!/bin/bash

# Script para gerar Cartões de Crédito Validos.
# SSH TLS
# Raphael Frajuca


# Esse Script Utiliza Outro Script Feito por MIM Usando o baluhn para calcular o digito verificador.

bin=$(echo $1 | awk -F "x" '{print $1}')
echo $bin > bin.beta
seq 1 $2 > limite.beta
while read limite
do
while read inn
do
cc=$(($RANDOM % 10))$(($RANDOM % 10))$(($RANDOM % 10))$(($RANDOM % 10))$(($RANDOM % 10))$(($RANDOM % 10))$(($RANDOM % 10))$(($RANDOM % 10))$(($RANDOM % 10))
numerogen=$2
seq=$(seq 1 $numerogen)
limite2=$(seq 1 $limite)
echo $inn$cc$(python /etc/ccgen/gen.py $cc) $((($RANDOM % 10) + 3))'/'20$(shuf -i16-22 -n1) $(($RANDOM % 10))$(($RANDOM % 10))$(($RANDOM % 10)) | awk '{print }'
done < bin.beta
done < limite.beta
