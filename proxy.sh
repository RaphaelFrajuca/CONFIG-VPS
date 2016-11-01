#!/bin/sh -e
clear

# Copyright Raphel Frajuca
# SSH TLS

versao=1.8.0

bash=$(echo $BASH)

if [ "$bash" = "/bin/bash" ]
then
echo "			\033[41;1;37m Proxy Checker $versao \033[0m "	
sleep 1
echo " Forma de USO: "
echo "sh $0 ARQUIVO COM A LISTA DE PROXYS.    "
echo " Exemplo:"
echo "sh $0 proxys.txt    "
exit 0
fi

corPadrao="\033[0m"
preto="\033[0;30m"
vermelho="\033[0;31m"
verde="\033[0;32m"
marrom="\033[0;33m"
azul="\033[0;34m"
purple="\033[0;35m"
cyan="\033[0;36m"
cinzaClaro="\033[0;37m"
pretoCinza="\033[1;30m"
vermelhoClaro="\033[1;31m"
verdeClaro="\033[1;32m"
amarelo="\033[1;33m"
azulClaro="\033[1;34m"
purpleClaro="\033[1;35m"
cyanClaro="\033[1;36m"
branco="\033[1;37m"

if [ "$1" = ""  ]
then
echo "			\033[41;1;37m Proxy Checker $versao \033[0m "	
sleep 1
echo " Forma de USO: "
echo "sh $0 ARQUIVO COM A LISTA DE PROXYS.    "
echo " Exemplo:"
echo "sh $0 proxys.txt    "
exit 0
fi


echo "			\033[41;1;37m Proxy Checker $versao \033[0m "	

lista=$1

sleep 1

echo "\033[44;1;37m Testando....     \033[0m "
while read proxys
do
case "$(curl --proxy $proxys -s --max-time 0.5 -I http://sshtls.com.br | sed 's/^[^ ]*  *\([0-9]\).*/\1/; 1q')" in
  [23]) echo "Proxy: $proxys [$verde OK \033[0m]" && echo "Proxy: $proxys [$verde OK \033[0m]" '#BadGuy-Proxy-checker' >> work.txt;;
  5) echo "Proxy: $proxys [$vermelho Erro \033[0m]" && echo "Proxy: $proxys [$vermelho Erro \033[0m]" '#BadGuy-Proxy-checker' >> fail.txt;;
  *) echo "Proxy: $proxys [$vermelho Não Funcionando. \033[0m]" && echo "Proxy: $proxys [$vermelho Não Funcionando. \033[0m]" '#BadGuy-Proxy-checker' >> fail.txt;;
esac

done < $lista

echo "Você pode ver a lista de Proxys Funcionais no arquivo $verde work.txt \033[0m"
echo "BadGuy"
echo "SSH TLS"
echo "Raphael Frajuca"

exit 0
