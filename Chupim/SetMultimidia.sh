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
     --menu "\n$OPCAO MULTIM�DIA\n\
      \nPara voltar ao menu anterior aperte CANCEL.\n" 17 75 7 \
      "Audacity" "Software livre de edi��o digital de �udio." \
      "VLC" "Reprodutor (player) e transmissor multim�dia." \
      "Amarok" "Reprodutor de �udio para o ambiente desktop KDE." \
      "Audacious" "Reprodutor de m�dia livre com foco em baixa utiliza��o de recursos." \
      "Dragon" "Player multim�dia, com foco na simplicidade." \
      "Juk" "Aplicativo de �udio jukebox." \
      "Kaudiocreator" "Interface KDE para ripar �udio." \
      "Kplayer" "Reprodutor de �udio para o ambiente desktop KDE." \
      "Mplayer" "MPlayer � um player de v�deo para Linux." \
      "Xfce4Mixer" "Aplicativo de controle de volume." \
      "Exaile" "Reprodutor de m�sica semelhante ao Amarok." \
      "Brasero" "Aplica��o de grava��o de CD/DVD." \
      "Lxdvdrip" "Interface para ripar �udio." \
      "KDEnlive" "Editor de v�deo." \
      "K3B" "Aplicativo para grava��o de CD e DVD do KDE" \
      "Avidemux" "Software livre para edi��o de v�deo" \
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