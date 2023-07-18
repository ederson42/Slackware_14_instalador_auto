#!/bin/bash
#Este arquivo é parte do programa CHUPIM
#
#
#
#   CHUPIM é um software livre; você pode redistribuí-lo e/ou 
#
#    modificá-lo dentro dos termos da Licença Pública Geral GNU como 
#
#    publicada pela Fundação do Software Livre (FSF); na versão 2 da 
#
#    Licença, ou (na sua opinião) qualquer versão.
#
#
#
#    Este programa é distribuído na esperança de que possa ser  útil, 
#
#    mas SEM NENHUMA GARANTIA; sem uma garantia implícita de ADEQUAÇÃO a qualquer
#
#    MERCADO ou APLICAÇÃO EM PARTICULAR. Veja a
#
#    Licença Pública Geral GNU para maiores detalhes.
#
#
#
#    Você deve ter recebido uma cópia da Licença Pública Geral GNU
#
#    junto com este programa, se não, escreva para a Fundação do Software
#
#    Livre(FSF) Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
while [ 0 ]; do
OPCAO="$(cat /opt/Chupim/tmp/opcao)"
dialog --title "Gerenciador CHUPIM" \
     --menu "\n$OPCAO INTERNET\n\
      \nPara voltar ao menu anterior aperte CANCEL.\n" 17 75 7 \
      "Firefox" "Navegador livre desenvolvido pela Mozilla Foundation." \
      "FlashPlayer" "Adobe Flash Player é um reprodutor de multimédia." \
      "Skype" "Software que permite comunicação pela Internet (voz sobre IP)." \
      "Opera" "Navegador web desenvolvida pela companhia Opera Software." \
      "Java" "Linguagem de programação interpretada para navegadores web." \
      "Youtube-dl" "Programa de linha de comando para baixar vídeos do YouTube." \
      "Chrome" "O navegador da Gigante das Buscas." \
      "WireShark" "Programa que analisa o tráfego de rede." \
      "aMule" "Programa peer-to-peer de arquivos para a rede eDonkey." \
      "Tightvnc" "Acessar seu computador de qualquer local com acesso à internet." \
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
     