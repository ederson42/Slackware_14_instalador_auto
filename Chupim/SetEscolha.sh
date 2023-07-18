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
     --menu "\nEscolha uma das categorias para $OPCAO.\n\
      \nPara voltar ao menu anterior aperte CANCEL.\n" 17 75 7 \
      "Ferramentas" "Ferramentas de sistema (Particionadores, editores etc..." \
      "Multimidia" "Players de música, editores vídeo etc..." \
      "Internet" "Navegadores, comunicadores etc..." \
      "Grafico" "Editores e visualizadores de imagem etc..." \
      "Jogos" "Jogos de ação estratégia etc..." \
      "Geral" "Os que não estão nas categorias anteriores." \
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