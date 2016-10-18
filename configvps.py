#!/usr/bin/env python3

# Copyright BadGuy (Raphael Frajuca)
# Perfect Carders (PC)
# SSH TLS

import os
os.system("clear")
print('			\033[1;41mConfigurar VPS Versão Python\033[1;m')

print("\033[1;44mObs: Este Script só funciona Nestas Versões do Linux:\033[1;m")
print("Ubuntu 12.** (The Precise Pangolin) LTS")
print("Ubuntu 14.** (The Trusty Tahr) LTS")
print("Debian 8 (jesse)")
ip = input("\033[1;44mDigite seu IP:\033[1;m")
arq = open('/etc/squid3/squid.conf', 'w')
squid = """
# SSH TLS ltda
# ALL RIGHTS RESERVED
# Arquivo de Configuração criado por SSH TLS (sshtls.com.br)
# NÃO RETIRE OS CRÉDITOS.
# Log de Atualizações:
# Mudado jeito das ACL'S
# Melhoria na qual o Squid se Comporta
# Ultima Data: 16/10/2016
# Tirado Comentarios que atrapalham o 'squid.conf'.
# Adicionado Quebra de linhas para melhorar o design na Pagina.
# Melhora nas configurações do 'accept' e prevenção de segurança do squid.
# Primeira versão do arquivo de configuração do Squid.
http_port 3128 transparent
http_port 8080
http_port 80
acl REQUEST method GET
acl REQUEST method POST
acl REQUEST method OPTIONS
acl REQUEST method HEAD
acl REQUEST method CONNECT
http_access allow net
http_access allow REQUEST
http_access deny all

"""
ipexport = """acl net dstdomain """
arq.write(ipexport)
arq.write( ip)
arq.write(squid)
arq.close()

print("\033[1;44mConfigurado com Sucesso!\033[1;m")
print("\033[1;44mReiniciando Servidor SQUID e SSH....\033[1;m")
os.system("echo 'Port 443' >> /etc/ssh/sshd_config")
os.system("service ssh restart")
os.system("squid3 -k reconfigure")
