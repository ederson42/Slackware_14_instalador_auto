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
     --menu "\n$OPCAO GRÁFICO\n\
      \nPara voltar ao menu anterior aperte CANCEL.\n" 17 75 7 \
      "Gimp" "Programa de código aberto para criação e edição de imagens." \
      "Geeqie" "Visualizador de imagens interativo baseado em GTK." \
      "Gwenview" "Visualizador de imagens simples para o KDE." \
      "Evolvotron" "Gera gravuras aleatórias." \
      "Mate-image" "Visualizador de imagens para o MATE." \
      "Mirage" "Simples Visualizador de Imagem." \
      "Dia" "Editor de diagrama." \
      "Converseen" "Múltiplo conversor de imagem." \
      "Calibre" "Gerenciador de E-Book." \
      "Blender" "Suíte Criação 3D." \
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