#!/bin/bash
echo "Escolha o tipo de varredura:"
echo "[1] Varredura pequena (Classe C - /24)"
echo "[2] Varredura média   (Classe B - /16)"
echo "[3] Varredura grande  (Classe A - /8)"
read -p "Opção: " opcao

read -p "Digite o IP base da rede (ex: 192.168.0.0): " base_ip
base_ip=$(echo "$base_ip" | sed 's/\.$//')

case $opcao in
	1)
	   rede=$(echo "$base_ip" | cut -d "." -f 1-3)
	   count=0
	   for host in  {1..254}; do
		ping -c 1 -W 1 $rede.$host &> /dev/null && {
		echo "$rede.$host ativo"
		((count++))
 		}
	   done
	   echo "Total de hosts ativos: $count"
	   ;;
	2)
	   rede=$(echo "$base_ip" | cut -d "." -f 1-2)
	   count=0
	   for i in {0..255}; do
		for host in {1..254}; do
		    ping -c 1 -W 1 $rede.$i.$host &> /dev/null && {
		    echo "$rede.$i.$host ativo"
		    ((count++))
		    }
		done
	   done
	   echo "Total de hosts ativos: $count"
	   ;;
	3)
	   rede=$(echo "$base_ip" | cut -d "." -f 1)
	   count=0
	   for j in {0..255}; do
  	       for i in {0..255}; do
		   for host in {1..254}; do
	    	       ping -c 1 -W 1 $rede.$j.$i.$host &> /dev/null && {
		       echo "$rede.$j.$i.$host ativo"
		       ((count++))
		       }
		   done
	       done
	   done
	   echo "Total de hosts ativos: $count"
	   ;;
	*)
	  echo "Opção inválida!"
          ;;
esac
