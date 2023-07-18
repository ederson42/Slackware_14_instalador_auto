#!/bin/bash
#Este arquivo � parte do programa CHUPIM
#
#
#
#   CHUPIM � um software livre; voc� pode redistribu�-lo e/ou 
#
#    modific�-lo dentro dos termos da Licen�a P�blica Geral GNU como 
#
#    publicada pela Funda��o do Software Livre (FSF); na vers�o 2 da 
#
#    Licen�a, ou (na sua opini�o) qualquer vers�o.
#
#
#
#    Este programa � distribu�do na esperan�a de que possa ser  �til, 
#
#    mas SEM NENHUMA GARANTIA; sem uma garantia impl�cita de ADEQUA��O a qualquer
#
#    MERCADO ou APLICA��O EM PARTICULAR. Veja a
#
#    Licen�a P�blica Geral GNU para maiores detalhes.
#
#
#
#    Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral GNU
#
#    junto com este programa, se n�o, escreva para a Funda��o do Software
#
#    Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
while [ 0 ]; do
OPCAO="$(cat /opt/Chupim/tmp/opcao)"
dialog --title "Gerenciador CHUPIM" \
     --menu "\n$OPCAO INTERNET\n\
      \nPara voltar ao menu anterior aperte CANCEL.\n" 17 75 7 \
      "Firefox" "Navegador livre desenvolvido pela Mozilla Foundation." \
      "FlashPlayer" "Adobe Flash Player � um reprodutor de multim�dia." \
      "Skype" "Software que permite comunica��o pela Internet (voz sobre IP)." \
      "Opera" "Navegador web desenvolvida pela companhia Opera Software." \
      "Java" "Linguagem de programa��o interpretada para navegadores web." \
      "Youtube-dl" "Programa de linha de comando para baixar v�deos do YouTube." \
      "Chrome" "O navegador da Gigante das Buscas." \
      "WireShark" "Programa que analisa o tr�fego de rede." \
      "aMule" "Programa peer-to-peer de arquivos para a rede eDonkey." \
      "Tightvnc" "Acessar seu computador de qualquer local com acesso � internet." \
      "Bittornado" "Aplicativo cliente para o protocolo BitTorrent." \
      "Voltar" "Voltar ao menu anterior." 2> /opt/Chupim/tmp/reply

      if [ ! $? = 0 ]; then
      rm -f /opt/Chupim/tmp/reply
      dialog --clear
      exit
      fi
      
      REPLY="$(cat /opt/Chupim/tmp/reply)"
      
      if [ "$OPCAO" = "INSTALAR" ]; then
	  chama="SetInstalar.sh"
	  else
	  chama="SetDesinstalar.sh"
      fi
      
      if [ "$REPLY" = "FlashPlayer" ] || [ "$REPLY" = "Java" ] ; then
	
		if [ "$REPLY" = "FlashPlayer" ]; then
		  if [ "$OPCAO" = "INSTALAR" ]; then
		    /opt/Chupim/flashplayer.sh
		  else
		      /opt/Chupim/rmflashplayer.sh
		  fi
		fi  

		if [ "$REPLY" = "Java" ]; then
		  if [ "$OPCAO" = "INSTALAR" ]; then
		    /opt/Chupim/javascript.sh
		  else
		      /opt/Chupim/rmjavascript.sh
		  fi
		fi
	else
	if [ "$REPLY" = "Voltar" ]; then
	exit
	fi
	/opt/Chupim/$chama
     fi
done
     