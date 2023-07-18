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
     --menu "\nEscolha uma das categorias para $OPCAO.\n\
      \nPara voltar ao menu anterior aperte CANCEL.\n" 17 75 7 \
      "Ferramentas" "Ferramentas de sistema (Particionadores, editores etc..." \
      "Multimidia" "Players de m�sica, editores v�deo etc..." \
      "Internet" "Navegadores, comunicadores etc..." \
      "Grafico" "Editores e visualizadores de imagem etc..." \
      "Jogos" "Jogos de a��o estrat�gia etc..." \
      "Geral" "Os que n�o est�o nas categorias anteriores." \
      "Voltar" "Voltar ao menu anterior." 2> /opt/Chupim/tmp/reply

      
      if [ ! $? = 0 ]; then
      rm -f /opt/Chupim/tmp/reply
      dialog --clear
      exit
      fi
      
      REPLY="$(cat /opt/Chupim/tmp/reply)"
       
	if [ "$REPLY" = "Ferramentas" ]; then
	/opt/Chupim/SetFerramentas.sh
	fi 

	if [ "$REPLY" = "Multimidia" ]; then
	/opt/Chupim/SetMultimidia.sh
	fi  

	if [ "$REPLY" = "Internet" ]; then
        /opt/Chupim/SetInternet.sh
	fi
	
	if [ "$REPLY" = "Grafico" ]; then
        /opt/Chupim/SetGrafico.sh
	fi
	
	if [ "$REPLY" = "Jogos" ]; then
        /opt/Chupim/SetJogos.sh
	fi
	
	if [ "$REPLY" = "Geral" ]; then
        /opt/Chupim/SetGeral.sh
	fi
	
	if [ "$REPLY" = "Voltar" ]; then
	exit
	fi
done