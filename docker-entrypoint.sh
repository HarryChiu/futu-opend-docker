#!/bin/bash
CONTAINER_IP=$(awk 'END{print $1}' /etc/hosts)

/FutuOpenD/FutuOpenD -telnet_ip=${CONTAINER_IP} -telnet_port=22222 -api_port=11111 -api_ip=${CONTAINER_IP} "$@"
