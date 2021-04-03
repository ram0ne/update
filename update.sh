#!/usr/bin/env bash

#Criado por Luciano Ramone
#Sistema de atualização simples...
#Feito em Kali Linux 2021
#ZSH

verm="\e[31;1m"
verd="\e[32;1m"
ci="\e[36;1m"
fim="\e[m"

logs="/root/log_up.txt"


(($UID > 0)) && { echo "Entre como ROOT e prossiga!!" ; exit 1 ;}

#====Log.txt======================================================
if [[ -e $logs ]];then
echo -e "${verd}Arquivo de log existente, continuando...${fim}"
sleep 2s
tail -n2 $logs
else
echo -e "${verm}$logs não existente, criando...${fim}"
>>$logs
fi
#==========================================================

#======Atualizando======================================
echo -e "\e[35;1mVersão: $(uname -vs) \e[m"
sleep 1s
echo -e "${ci}Iniciando atualização do sistema!!!${fim}"
echo -e "${verd}Etapa 1/4${fim}"
apt update -y
cat >>$logs <<EOF
Comando APT UPDATE executado com sucesso,
as `date +%H:%M`
EOF
sleep 2s
clear

#======Etapa 2============================================
echo -e "${verd}Etapa 2/4${fim}"
apt upgrade -y
cat >>$logs <<EOF
Comando APT UPGRADE executado com sucesso,
as `date +%H:%M`
EOF
sleep 2s
clear
#=======Etapa 3===============================================
echo -e "${verd}Etapa 3/4${fim}"
apt full-upgrade -y
cat >>$logs <<EOF
Comando APT FULL-UPGRADE executado com sucesso,
as `date +%H%M`
EOF
sleep 2s
clear
#=======Etapa 4===============================================
echo -e "${verd}Etapa 4/4${fim}"
apt autoremove -y
cat >>$logs <<EOF
Limpando APT AUTOREMOVE executado com sucesso,
as `date +%H%M`
EOF
sleep 2s
clear
#========Registrando att======================================
echo -e "${verd}Registrando em $logs ...${fim}"
cat >>$logs <<EOF
Ultima atualização em:
$(date)
EOF
sleep 1s

echo -e "${ci}Kali Linux atualizado com sucesso by: Luciano Ramone${fim}"
