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
     --menu "\n$OPCAO MULTIMÍDIA\n\
      \nPara voltar ao menu anterior aperte CANCEL.\n" 17 75 7 \
      "Audacity" "Software livre de edição digital de áudio." \
      "VLC" "Reprodutor (player) e transmissor multimídia." \
      "Amarok" "Reprodutor de áudio para o ambiente desktop KDE." \
      "Audacious" "Reprodutor de mídia livre com foco em baixa utilização de recursos." \
      "Dragon" "Player multimídia, com foco na simplicidade." \
      "Juk" "Aplicativo de áudio jukebox." \
      "Kaudiocreator" "Interface KDE para ripar áudio." \
      "Kplayer" "Reprodutor de áudio para o ambiente desktop KDE." \
      "Mplayer" "MPlayer é um player de vídeo para Linux." \
      "Xfce4Mixer" "Aplicativo de controle de volume." \
      "Exaile" "Reprodutor de música semelhante ao Amarok." \
      "Brasero" "Aplicação de gravação de CD/DVD." \
      "Lxdvdrip" "Interface para ripar áudio." \
      "KDEnlive" "Editor de vídeo." \
      "K3B" "Aplicativo para gravação de CD e DVD do KDE" \
      "Avidemux" "Software livre para edição de vídeo" \
      "XMMS" "Player parecido como o Winamp." \
      "2ManDVD" "Programa para criar dvd no Linux" \
      "DeVeDe" "Criador de vcds e dvds." \
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