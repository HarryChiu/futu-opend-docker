#!/bin/bash
CONTAINER_IP=$(awk 'END{print $1}' /etc/hosts)

/home/FutuOpenD_5.2.1408_Ubuntu16.04/FutuOpenD_5.2.1408_Ubuntu16.04/FutuOpenD -telnet_ip=${CONTAINER_IP} -telnet_port=22222 -api_port=11111 -api_ip=${CONTAINER_IP} "$@"
