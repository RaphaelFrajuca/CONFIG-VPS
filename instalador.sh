#!/bin/sh -e

echo "			\033[41;1;37m Instalador \033[0m "	
sleep 1
echo "\033[44;1;37m Selecione o Utilitario:     \033[0m "

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

sleep 1.5s
echo "$cyan [1] CONFIG-VPS"
echo "$cyan [2] MINER-BITCOIN"
echo "$cyan [3] PROXY-CHECKER"
echo "$cyan [4] CC-GEN"
read utilitario

if [ "$utilitario" = "1" ]
then
echo "\033[44;1;37m Selecione a Versão:     \033[0m "
sleep 1.5s
echo "$cyan [1] Shell-Script (Recomendado)"
echo "$cyan [2] Python "
read versao
if [ "$versao" = "1" ]
then
sleep 1
echo "\033[44;1;37m Instalando....     \033[0m "
sleep 0.5s
wget https://raw.githubusercontent.com/RaphaelFrajuca/CONFIG-VPS/master/configvps.sh
mv configvps.sh configvps
mv configvps /bin/
chmod a+x /bin/configvps
echo "\033[44;1;37m Instalado com Sucesso!     \033[0m "

echo "Você Pode Executar o Utilitario Assim:\n"
echo "$verde configvps\033[0m $vermelho IP-VPS \033[0m "
fi

if [ "$versao" = "2" ]
then
sleep 1
echo "\033[44;1;37m Instalando....     \033[0m "
sleep 0.5s
wget https://raw.githubusercontent.com/RaphaelFrajuca/CONFIG-VPS/master/configvps.py
mv configvps.py configvps
mv configvps /bin/
chmod a+x /bin/configvps
echo "\033[44;1;37m Instalado com Sucesso!     \033[0m "

echo "Você Pode Executar o Utilitario Assim:\n"
echo "$verde configvps\033[0m"
fi

fi

if [ "$utilitario" = "2" ]
then
sleep 1
echo "\033[44;1;37m Instalando....     \033[0m "
sleep 0.5s
wget https://raw.githubusercontent.com/RaphaelFrajuca/CONFIG-VPS/master/miner.sh
echo "\033[44;1;37m Instalado com Sucesso!     \033[0m "

echo "Você Pode Executar o Utilitario Assim:\n"
echo "sudo sh$verde miner.sh CARTEIRA BITCOIN\033[0m"
fi

if [ "$utilitario" = "3" ]
then
sleep 1
echo "\033[44;1;37m Instalando....     \033[0m "
sleep 0.5s
wget https://raw.githubusercontent.com/RaphaelFrajuca/CONFIG-VPS/master/proxy.sh
mv proxy.sh proxy
mv proxy /bin/
chmod a+x /bin/proxy
echo "\033[44;1;37m Instalado com Sucesso!     \033[0m "

echo "Você Pode Executar o Utilitario Assim:\n"
echo "sudo $verde proxy ARQUIVO/CAMINHO COM A LISTA DE PROXYS\033[0m"
fi

if [ "$utilitario" = "4" ]
then
sleep 1
echo "\033[44;1;37m Instalando....     \033[0m "
sleep 0.5s
apt-get install git python wget -y > /dev/null
wget https://raw.githubusercontent.com/RaphaelFrajuca/CONFIG-VPS/master/cc.sh
mv cc.sh cc
mv cc /bin/
chmod a+x /bin/cc
mkdir /etc/ccgen/
wget -O /etc/ccgen/ https://raw.githubusercontent.com/RaphaelFrajuca/CONFIG-VPS/master/gen.py
git clone https://github.com/benhodgson/baluhn.git luhn
python luhn/setup.py install
rm -rf luhn
echo "\033[44;1;37m Instalado com Sucesso!     \033[0m "

echo "Você Pode Executar o Utilitario Assim:\n"
echo "sudo $verde cc \033[0m BIN NUMERO-DE-CC`S"
fi

exit 0









