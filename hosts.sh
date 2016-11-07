#!/bin/sh -e

clear

# Copyright Raphel Frajuca
# SSH TLS

versao=1.8.5

bash=$(echo $BASH)

if [ "$bash" = "/bin/bash" ]
then
echo "			\033[41;1;37m Testador de Hosts $versao \033[0m "	
sleep 1
echo " Forma de USO: "
echo "sh $0 ARQUIVO COM A LISTA DE HOSTS PROXY    "
echo " Exemplo:"
echo "sh $0 hosts.txt 127.0.0.1:8080   "
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
echo "			\033[41;1;37m Testador de Hosts $versao \033[0m "	
sleep 1
echo " Forma de USO: "
echo "sh $0 ARQUIVO COM A LISTA DE HOSTS PROXY    "
echo " Exemplo:"
echo "sh $0 hosts.txt    "
exit 0
fi

if [ "$2" = ""  ]
then
echo "			\033[41;1;37m Testador de Hosts $versao \033[0m "	
sleep 1
echo " Forma de USO: "
echo "sh $0 ARQUIVO COM A LISTA DE HOSTS PROXY    "
echo " Exemplo:"
echo "sh $0 hosts.txt 127.0.0.1:8080   "
exit 0
fi


echo "			\033[41;1;37m Testador de Hosts $versao \033[0m "	

lista=$1

sleep 1

echo "\033[44;1;37m Testando....     \033[0m "

while read hosts
do
if [ "$3" = "--no-proxy" ]
then
curl=$(curl --max-time 3 -s -o /dev/null -w "%{http_code}" $hosts)
curlGET=$(curl -X GET --max-time 3 -s -o /dev/null -w "%{http_code}" $hosts)
curlPOST=$(curl -X POST --max-time 3 -s -o /dev/null -w "%{http_code}" $hosts)
curlHEAD=$(curl -X HEAD --max-time 3 -s -o /dev/null -w "%{http_code}" $hosts)
curlPUT=$(curl -X PUT --max-time 3 -s -o /dev/null -w "%{http_code}" $hosts)
curlTRACE=$(curl -X TRACE --max-time 3 -s -o /dev/null -w "%{http_code}" $hosts)
curlOPTIONS=$(curl -X OPTIONS --max-time 3 -s -o /dev/null -w "%{http_code}" $hosts)
curlDELETE=$(curl -X DELETE --max-time 3 -s -o /dev/null -w "%{http_code}" $hosts)
else
curl=$(curl --proxy $2 --max-time 3 -s -o /dev/null -w "%{http_code}" $hosts)
curlGET=$(curl --proxy $2 -X GET --max-time 3 -s -o /dev/null -w "%{http_code}" $hosts)
curlPOST=$(curl --proxy $2 -X POST --max-time 3 -s -o /dev/null -w "%{http_code}" $hosts)
curlHEAD=$(curl --proxy $2 -X HEAD --max-time 3 -s -o /dev/null -w "%{http_code}" $hosts)
curlPUT=$(curl --proxy $2 -X PUT --max-time 3 -s -o /dev/null -w "%{http_code}" $hosts)
curlTRACE=$(curl --proxy $2 -X TRACE --max-time 3 -s -o /dev/null -w "%{http_code}" $hosts)
curlOPTIONS=$(curl --proxy $2 -X OPTIONS --max-time 3 -s -o /dev/null -w "%{http_code}" $hosts)
curlDELETE=$(curl --proxy $2 -X DELETE --max-time 3 -s -o /dev/null -w "%{http_code}" $hosts)
fi

echo "$cyanClaro Host\033[0m $amarelo $hosts \033[0m Status:  \n"
echo "$verde$curlGET GET \033[0m"
echo "$verde$curlPOST POST \033[0m"
echo "$verde$curlHEAD HEAD \033[0m"
echo "$verde$curlPUT PUT \033[0m"
echo "$verde$curlTRACE TRACE \033[0m"
echo "$verde$curlOPTIONS OPTIONS \033[0m"
echo "$verde$curlDELETE DELETE \033[0m"
sleep 0.5s
hostscat=$(cat $lista | wc -l)
echo "$cyanClaro Foram Testados $hostscat Hosts. \033[0m"
done < $lista

exit 0
