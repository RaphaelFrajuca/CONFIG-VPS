#!/bin/bash

# Script para gerar Cartões de Crédito Validos.
# SSH TLS
# Raphael Frajuca
if [ "$1" = "" ]
then
echo "Usage:"
echo "$0 BIN NUMBER OF CCGEN 'SEPARATOR'"
exit 0
fi

if [ "$2" = "" ]
then
echo "Usage:"
echo "$0 BIN NUMBER OF CCGEN 'SEPARATOR'"
exit 0
fi

if [ "$3" = "" ]
then
echo "Usage:"
echo "$0 BIN NUMBER OF CCGEN 'SEPARATOR'"
exit 0
fi

# Esse Script Utiliza Outro Script Feito por MIM Usando o baluhn para calcular o digito verificador.
separator=$3
bin=$(echo $1 | awk -F "x" '{print $1}')
echo $bin > /etc/ccgen/bin.beta
seq 1 $2 > /etc/ccgen/limite.beta
while read limite
do
while read inn
do
ccorig="$1"

ccsub1=${ccorig/x/$((RANDOM % 10))}
ccsub2=${ccsub1/x/$((RANDOM % 10))}
ccsub3=${ccsub2/x/$((RANDOM % 10))}
ccsub4=${ccsub3/x/$((RANDOM % 10))}
ccsub5=${ccsub4/x/$((RANDOM % 10))}
ccsub6=${ccsub5/x/$((RANDOM % 10))}
ccsub7=${ccsub6/x/$((RANDOM % 10))}
ccsub8=${ccsub7/x/$((RANDOM % 10))}
ccsub9=${ccsub8/x/$((RANDOM % 10))}
ccsub10=${ccsub9/x/$((RANDOM % 10))}
ccsub11=${ccsub10/x/$((RANDOM % 10))}
ccsub12=${ccsub11/x/$((RANDOM % 10))}
ccsub13=${ccsub12/x/$((RANDOM % 10))}
ccsub14=${ccsub13/x/$((RANDOM % 10))}
ccsub15=${ccsub14/x/$((RANDOM % 10))}
ccsub16=${ccsub15/x/$((RANDOM % 10))}
ccsubfinal=${ccsub16/x/$((RANDOM % 10))}
ccfinal=$(echo $ccsubfinal | awk -F "" '{print $1$2$3$4$5$6$7$8$9$10$11$12$13$14$15}')
numerogen=$2
seq=$(seq 1 $numerogen)
limite2=$(seq 1 $limite)
echo $ccfinal$(python /etc/ccgen/gen.py $ccfinal)"$separator"$((($RANDOM % 10) + 3))"$separator"20$(shuf -i17-22 -n1)"$separator"$(($RANDOM % 10))$(($RANDOM % 10))$(($RANDOM % 10)) | awk '{print }'
done < /etc/ccgen/bin.beta
done < /etc/ccgen/limite.beta

