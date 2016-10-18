#!/bin/sh
clear
# Copyright Raphel Frajuca
# SSH TLS

versao=4.7.3



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
echo "			\033[41;1;37m Configurar VPS $versao \033[0m "				
sleep 1
echo "$verde Forma de USO: \033[0m"
echo "sh $0 $vermelho IP \033[0m  \n "
echo "$verde Exemplo:\033[0m"
echo "sh $0 $vermelho 189.79.55.110 \033[0m   \n"
exit 0
fi

ip=$1


echo "			\033[41;1;37m Configurar VPS $versao \033[0m "	
sleep 1
echo "IP=$verde$ip\033[0m   "
sleep 1

echo "\033[44;1;37m Termos e Condições:     \033[0m "
sleep 2

echo "$cinzaClaro	 * Configurar VPS \033[0m   \n"
echo "$cinzaClaro	 * Caso aceite esses termos, fique ciente de que: \033[0m "
echo "$cinzaClaro	 * A utilização/modificação desse Script e de sua Total Responsabilidade, \033[0m "
echo "$cinzaClaro	 * sendo que eu, Raphael Frajuca, não me responsabilizo por danos que possam  \033[0m "
echo "$cinzaClaro	 * ser causados a seu sistema caso esse script seja mal utilizado/utilizado de forma  \033[0m "
echo "$cinzaClaro	 * incorreta ou Modificado. \033[0m "
echo "$cinzaClaro	 * Esse script tem o fim de tentar ajudar a instalar e comfigurar um Servidor SQUID e \033[0m "
echo "$cinzaClaro	 * liberar a Porta 443 em seu servidor SSH. \033[0m "
echo "$cinzaClaro	 * QUALQUER pessoa tem a permissão do autor de adaptar esse Script para seus requisitos \033[0m "
echo "$cinzaClaro	 * e Melhorar esse script por sí próprio a fim de ajudar a Comunidade. \033[0m "
echo "$cinzaClaro	 * Esse script pode ser usado a fins comerciais, mas NUNCA pode ser Vendido/Alugado,  \033[0m "
echo "$cinzaClaro	 * somente ser usado a beneficio próprio ou da Comunidade. \033[0m \n"
echo "$cinzaClaro        * Caso não aceite esses termos, encerre esse Script AGORA. \033[0m "

sleep 30

echo "\033[44;1;37m Escolha o seu Sistema Operacional:     \033[0m "
sleep 1.5s
echo "$cyan [1] Ubuntu"
echo "$cyan [2] OpenSuse"
echo "$cyan [3] CentOS"
echo "$cyan [4] Debian"
read so
sleep 1

if [ "$so" = "1" ]
then
clear
echo "\033[44;1;37m Baixando Recursos....     \033[0m "
sleep 1
sudo apt-get update > /dev/null
sudo apt-get upgrade -y > /dev/null
sudo apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python nano squid3 squid  -y > /dev/null
sleep 1
echo "\033[44;1;37m Configurando....     \033[0m "
sleep 1

if [ -d "/etc/squid3" ]
then
echo "# SSH TLS ltda " > /etc/squid3/squid.conf
echo "# ALL RIGHTS RESERVED " >> /etc/squid3/squid.conf
echo "# Arquivo de Configuração criado por SSH TLS (sshtls.com.br) " >> /etc/squid3/squid.conf
echo "# NÃO RETIRE OS CRÉDITOS. " >> /etc/squid3/squid.conf
echo "# Log de Atualizações: " >> /etc/squid3/squid.conf
echo "# Mudado jeito das ACL'S" >> /etc/squid3/squid.conf
echo "# Melhoria na qual o Squid se Comporta" >> /etc/squid3/squid.conf
echo "# Ultima Data: 16/10/2016 " >> /etc/squid3/squid.conf
echo "# Tirado Comentarios que atrapalham o 'squid.conf'. " >> /etc/squid3/squid.conf
echo "# Adicionado Quebra de linhas para melhorar o design na Pagina. " >> /etc/squid3/squid.conf
echo "# Melhora nas configurações do 'accept' e prevenção de segurança do squid. " >> /etc/squid3/squid.conf
echo "# Primeira versão do arquivo de configuração do Squid. " >> /etc/squid3/squid.conf
echo "http_port 3128 transparent" >> /etc/squid3/squid.conf
echo "http_port 8080" >> /etc/squid3/squid.conf
echo "http_port 80" >> /etc/squid3/squid.conf
echo "acl net dstdomain $ip" >> /etc/squid3/squid.conf
echo "acl REQUEST method GET" >> /etc/squid3/squid.conf
echo "acl REQUEST method POST" >> /etc/squid3/squid.conf
echo "acl REQUEST method OPTIONS" >> /etc/squid3/squid.conf
echo "acl REQUEST method HEAD" >> /etc/squid3/squid.conf
echo "acl REQUEST method CONNECT" >> /etc/squid3/squid.conf
echo "http_access allow net" >> /etc/squid3/squid.conf
echo "http_access allow REQUEST" >> /etc/squid3/squid.conf
echo "http_access deny all" >> /etc/squid3/squid.conf
sleep 2

echo "Port 443" >> /etc/ssh/sshd_config

else
echo "# SSH TLS ltda " > /etc/squid/squid.conf
echo "# ALL RIGHTS RESERVED " >> /etc/squid/squid.conf
echo "# Arquivo de Configuração criado por SSH TLS (sshtls.com.br) " >> /etc/squid/squid.conf
echo "# NÃO RETIRE OS CRÉDITOS. " >> /etc/squid/squid.conf
echo "# Log de Atualizações: " >> /etc/squid/squid.conf
echo "# Mudado jeito das ACL'S" >> /etc/squid/squid.conf
echo "# Melhoria na qual o Squid se Comporta" >> /etc/squid/squid.conf
echo "# Ultima Data: 16/10/2016 " >> /etc/squid/squid.conf
echo "# Tirado Comentarios que atrapalham o 'squid.conf'. " >> /etc/squid/squid.conf
echo "# Adicionado Quebra de linhas para melhorar o design na Pagina. " >> /etc/squid/squid.conf
echo "# Melhora nas configurações do 'accept' e prevenção de segurança do squid. " >> /etc/squid/squid.conf
echo "# Primeira versão do arquivo de configuração do Squid. " >> /etc/squid/squid.conf
echo "http_port 3128 transparent" >> /etc/squid/squid.conf
echo "http_port 8080" >> /etc/squid/squid.conf
echo "http_port 80" >> /etc/squid/squid.conf
echo "acl net dstdomain $ip" >> /etc/squid/squid.conf
echo "acl REQUEST method GET" >> /etc/squid/squid.conf
echo "acl REQUEST method POST" >> /etc/squid/squid.conf
echo "acl REQUEST method OPTIONS" >> /etc/squid/squid.conf
echo "acl REQUEST method HEAD" >> /etc/squid/squid.conf
echo "acl REQUEST method CONNECT" >> /etc/squid/squid.conf
echo "http_access allow net" >> /etc/squid/squid.conf
echo "http_access allow REQUEST" >> /etc/squid/squid.conf
echo "http_access deny all" >> /etc/squid/squid.conf
sleep 2
fi
fi

echo "\033[44;1;37m  Aplicando Mudanças....    \033[0m "

if [ -d "/etc/squid3" ]
then
squid3 -k reconfigure
service ssh restart
else
squid -k reconfigure
service ssh restart > /dev/null
fi
if true
then
echo "\033[44;1;37m Configurado com Sucesso !    \033[0m "
fi















if [ "$so" = "2" ]
then
clear
echo "\033[44;1;37m Baixando Recursos....     \033[0m "
sleep 1
zypper in squid
zypper in nano 
zypper in sudo
service httpd stop 
iptables -F
iptables -X
sleep 1
echo "\033[44;1;37m Configurando....     \033[0m "
sleep 1

echo "# SSH TLS ltda " > /etc/squid/squid.conf
echo "# ALL RIGHTS RESERVED " >> /etc/squid/squid.conf
echo "# Arquivo de Configuração criado por SSH TLS (sshtls.com.br) " >> /etc/squid/squid.conf
echo "# NÃO RETIRE OS CRÉDITOS. " >> /etc/squid/squid.conf
echo "# Log de Atualizações: " >> /etc/squid/squid.conf
echo "# Mudado jeito das ACL'S" >> /etc/squid/squid.conf
echo "# Melhoria na qual o Squid se Comporta" >> /etc/squid/squid.conf
echo "# Ultima Data: 16/10/2016 " >> /etc/squid/squid.conf
echo "# Tirado Comentarios que atrapalham o 'squid.conf'. " >> /etc/squid/squid.conf
echo "# Adicionado Quebra de linhas para melhorar o design na Pagina. " >> /etc/squid/squid.conf
echo "# Melhora nas configurações do 'accept' e prevenção de segurança do squid. " >> /etc/squid/squid.conf
echo "# Primeira versão do arquivo de configuração do Squid. " >> /etc/squid/squid.conf
echo "http_port 3128 transparent" >> /etc/squid/squid.conf
echo "http_port 8080" >> /etc/squid/squid.conf
echo "http_port 80" >> /etc/squid/squid.conf
echo "acl net dstdomain $ip" >> /etc/squid/squid.conf
echo "acl REQUEST method GET" >> /etc/squid/squid.conf
echo "acl REQUEST method POST" >> /etc/squid/squid.conf
echo "acl REQUEST method OPTIONS" >> /etc/squid/squid.conf
echo "acl REQUEST method HEAD" >> /etc/squid/squid.conf
echo "acl REQUEST method CONNECT" >> /etc/squid/squid.conf
echo "http_access allow net" >> /etc/squid/squid.conf
echo "http_access allow REQUEST" >> /etc/squid/squid.conf
echo "http_access deny all" >> /etc/squid/squid.conf
sleep 2

echo "Port 443" >> /etc/ssh/sshd_config


echo "\033[44;1;37m  Aplicando Mudanças....    \033[0m "

squid -k reconfigure
service ssh restart

if true
then
echo "\033[44;1;37m Configurado com Sucesso !    \033[0m "
fi
fi















if [ "$so" = "3" ]
then
clear
echo "\033[44;1;37m Baixando Recursos....     \033[0m "
sleep 1
yum install squid 
yum install nano 
yum install sudo 
service httpd stop > /dev/null
iptables -F
iptables -X
sleep 1
echo "\033[44;1;37m Configurando....     \033[0m "
sleep 1

echo "# SSH TLS ltda " > /etc/squid/squid.conf
echo "# ALL RIGHTS RESERVED " >> /etc/squid/squid.conf
echo "# Arquivo de Configuração criado por SSH TLS (sshtls.com.br) " >> /etc/squid/squid.conf
echo "# NÃO RETIRE OS CRÉDITOS. " >> /etc/squid/squid.conf
echo "# Log de Atualizações: " >> /etc/squid/squid.conf
echo "# Mudado jeito das ACL'S" >> /etc/squid/squid.conf
echo "# Melhoria na qual o Squid se Comporta" >> /etc/squid/squid.conf
echo "# Ultima Data: 16/10/2016 " >> /etc/squid/squid.conf
echo "# Tirado Comentarios que atrapalham o 'squid.conf'. " >> /etc/squid/squid.conf
echo "# Adicionado Quebra de linhas para melhorar o design na Pagina. " >> /etc/squid/squid.conf
echo "# Melhora nas configurações do 'accept' e prevenção de segurança do squid. " >> /etc/squid/squid.conf
echo "# Primeira versão do arquivo de configuração do Squid. " >> /etc/squid/squid.conf
echo "http_port 3128 transparent" >> /etc/squid/squid.conf
echo "http_port 8080" >> /etc/squid/squid.conf
echo "http_port 80" >> /etc/squid/squid.conf
echo "acl net dstdomain $ip" >> /etc/squid/squid.conf
echo "acl REQUEST method GET" >> /etc/squid/squid.conf
echo "acl REQUEST method POST" >> /etc/squid/squid.conf
echo "acl REQUEST method OPTIONS" >> /etc/squid/squid.conf
echo "acl REQUEST method HEAD" >> /etc/squid/squid.conf
echo "acl REQUEST method CONNECT" >> /etc/squid/squid.conf
echo "http_access allow net" >> /etc/squid/squid.conf
echo "http_access allow REQUEST" >> /etc/squid/squid.conf
echo "http_access deny all" >> /etc/squid/squid.conf
sleep 2

echo "Port 443" >> /etc/ssh/sshd_config


echo "\033[44;1;37m  Aplicando Mudanças....    \033[0m "

squid -k reconfigure
service ssh restart

if true
then
echo "\033[44;1;37m Configurado com Sucesso !    \033[0m "
fi
fi











if [ "$so" = "4" ]
then
clear
echo "\033[44;1;37m Baixando Recursos....     \033[0m "
sleep 1
apt-get update > /dev/null
apt-get upgrade -y > /dev/null
apt-get install sudo perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python nano squid3 squid  -y > /dev/null
sleep 1
echo "\033[44;1;37m Configurando....     \033[0m "
sleep 1

echo "# SSH TLS ltda " > /etc/squid3/squid.conf
echo "# ALL RIGHTS RESERVED " >> /etc/squid3/squid.conf
echo "# Arquivo de Configuração criado por SSH TLS (sshtls.com.br) " >> /etc/squid3/squid.conf
echo "# NÃO RETIRE OS CRÉDITOS. " >> /etc/squid3/squid.conf
echo "# Log de Atualizações: " >> /etc/squid3/squid.conf
echo "# Mudado jeito das ACL'S" >> /etc/squid3/squid.conf
echo "# Melhoria na qual o Squid se Comporta" >> /etc/squid3/squid.conf
echo "# Ultima Data: 16/10/2016 " >> /etc/squid3/squid.conf
echo "# Tirado Comentarios que atrapalham o 'squid.conf'. " >> /etc/squid3/squid.conf
echo "# Adicionado Quebra de linhas para melhorar o design na Pagina. " >> /etc/squid3/squid.conf
echo "# Melhora nas configurações do 'accept' e prevenção de segurança do squid. " >> /etc/squid3/squid.conf
echo "# Primeira versão do arquivo de configuração do Squid. " >> /etc/squid3/squid.conf
echo "http_port 3128 transparent" >> /etc/squid3/squid.conf
echo "http_port 8080" >> /etc/squid3/squid.conf
echo "http_port 80" >> /etc/squid3/squid.conf
echo "acl net dstdomain $ip" >> /etc/squid3/squid.conf
echo "acl REQUEST method GET" >> /etc/squid3/squid.conf
echo "acl REQUEST method POST" >> /etc/squid3/squid.conf
echo "acl REQUEST method OPTIONS" >> /etc/squid3/squid.conf
echo "acl REQUEST method HEAD" >> /etc/squid3/squid.conf
echo "acl REQUEST method CONNECT" >> /etc/squid3/squid.conf
echo "http_access allow net" >> /etc/squid3/squid.conf
echo "http_access allow REQUEST" >> /etc/squid3/squid.conf
echo "http_access deny all" >> /etc/squid3/squid.conf
sleep 2

echo "Port 443" >> /etc/ssh/sshd_config


echo "\033[44;1;37m  Aplicando Mudanças....    \033[0m "

if [ "$squid" = "squid3" ]
then
squid3 -k reconfigure
service ssh restart
else
squid -k reconfigure
service ssh restart > /dev/null
fi
if true
then
echo "\033[44;1;37m Configurado com Sucesso !    \033[0m "
fi
fi






sleep 3

echo "\033[44;1;37m Deseja Instalar nossa Regra de IPTABLES para Evitar ataques e bloquear Torrent ?   \033[0m "
sleep 1.5s
echo "$cyan [1] Sim"
echo "$cyan [2] Não"
read firewall
sleep 1

if [ "$firewall" = "1" ]
then
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t mangle -F
iptables -t mangle -X

echo "\033[44;1;37m Bloqueando Tudo....   \033[0m "
sleep 1
# Mudando a politica - Começa bloqueando tudo
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

echo "\033[44;1;37m Liberando conexões pre-estabelecidas...  \033[0m "
sleep 1
# Libera conexões pre-estabelecidas
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

echo "\033[44;1;37m Liberando HTTPS....   \033[0m "
sleep 1
# Liberar HTTPS
iptables -A OUTPUT -p tcp -d $ip --dport 443 -m state --state NEW -j ACCEPT

echo "\033[44;1;37m Liberando HTTP.....   \033[0m "
sleep 1
# Liberar HTTP
iptables -A OUTPUT -p tcp -d $ip --dport 80 -m state --state NEW -j ACCEPT

echo "\033[44;1;37m Liberando DNS......   \033[0m "
sleep 1
# Liberar DNS
iptables -A OUTPUT -p tcp --dport 53 -m state --state NEW -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -m state --state NEW -j ACCEPT

echo "\033[44;1;37m Liberando DHCP.......   \033[0m "
sleep 1
#Liberar DHCP
iptables -A OUTPUT -p tcp --dport 67 -m state --state NEW -j ACCEPT
iptables -A OUTPUT -p udp --dport 67 -m state --state NEW -j ACCEPT

echo "\033[44;1;37m Liberando SSH........   \033[0m "
sleep 1
#Liberar SSH
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT

echo "\033[44;1;37m Liberando SQUID.........   \033[0m "
sleep 1
#Liberar SQUID
iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 3128 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 8080 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 3128 -j ACCEPT
iptables -A FORWARD -p tcp --dport 8080 -j ACCEPT
iptables -A FORWARD -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp --dport 3128 -j ACCEPT

echo "\033[44;1;37m Bloqueando PING...........   \033[0m "
sleep 1
#Bloquear PING
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP

echo "\033[44;1;37m Liberando WEBMIN.......   \033[0m "
sleep 1
#Liberar WEBMIN
iptables -A INPUT -p tcp --dport 10000 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 10000 -j ACCEPT

echo "\033[44;1;37m Regras Inseridas com Sucesso.   \033[0m "
sleep 1
echo SSH TLS
sleep 1
echo "Copyright: Raphael Frajuca"
sleep 1
else
sleep 1
echo SSH TLS
sleep 1
echo "Copyright: Raphael Frajuca"
sleep 1
exit 0
fi
exit 0
