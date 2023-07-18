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
     --menu "\n$OPCAO GERAL\n\
      \nPara voltar ao menu anterior aperte CANCEL.\n" 17 75 7 \
      "DosBox" "Utilizar programas antigos feitos para DOS." \
      "Gnome" "Projeto de software livre abrangendo o Ambiente de Trabalho." \
      "KDE" "Interface Gráfica para o Linux." \
      "Tint2" "Barra de tarefas para openbox3." \
      "Mate-Desktop" "Ambiente de desktop MATE." \
      "KoceanSaver" "Screensaver subaquático para KDE." \
      "3Ddesktop" "Ambiente 3D fullscreen." \
      "Bash-Completion" "Programa para autocompletar comando usando TAB." \
      "EmacSpeak" "Interface de voz para o Linux." \
      "Lxde" "Interface Gráfica leve para o Linux." \
      "Klavaro" "Desenvolva sua capacidade de digitação." \
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
      
	if [ "$REPLY" = "Voltar" ]; then
	exit
	fi
	
	/opt/Chupim/$chama
done