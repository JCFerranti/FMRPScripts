#! /bin/sh
#
# Nome: trocarmac.sh
#
# Trocar mac de placa de rede no linux
# Produzido por <falecom EM robertoalmeida.com>
#
# 04/10/2006 - 20:25
#
############## PARAMETROS ##############
NOVOMAC="00:02:2D:45:22:20"
INTERFACE="eth0"
IP="10.1.1.2"
MASCARA="255.255.255.0"
GATEWAY="10.1.1.1"
####
ifconfig $INTERFACE down 
ifconfig $INTERFACE hw ether $NOVOMAC
ifconfig $INTERFACE $IP netmask $MASCARA
route add default gw $GATEWAY
#########################################