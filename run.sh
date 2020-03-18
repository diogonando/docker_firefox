#!/bin/bash

#Obtem IP para cadastrar no xhosts
IP=`ifconfig -a | grep -A 3 en0: | tail -1 | awk '{print $2}'`
#garante que DISPLAY esta local
export DISPLAY=:0
#Cadastra xhosts
xhost + $IP
#Executa firefox exportando display
docker run -ti --rm \
       -e DISPLAY=$IP:0 \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       firefox
