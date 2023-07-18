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
     --menu "\n$OPCAO GR�FICO\n\
      \nPara voltar ao menu anterior aperte CANCEL.\n" 17 75 7 \
      "Gimp" "Programa de c�digo aberto para cria��o e edi��o de imagens." \
      "Geeqie" "Visualizador de imagens interativo baseado em GTK." \
      "Gwenview" "Visualizador de imagens simples para o KDE." \
      "Evolvotron" "Gera gravuras aleat�rias." \
      "Mate-image" "Visualizador de imagens para o MATE." \
      "Mirage" "Simples Visualizador de Imagem." \
      "Dia" "Editor de diagrama." \
      "Converseen" "M�ltiplo conversor de imagem." \
      "Calibre" "Gerenciador de E-Book." \
      "Blender" "Su�te Cria��o 3D." \
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