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
if [ -e /usr/lib/mozilla/plugins/libflashplayer.so ] ; then
      dialog --msgbox "Flash player J� EST� INSTALADO EM SEU SISTEMA." 5 70
    else
    mkdir /opt/Chupim/tmp/flashplayer
    cd /opt/Chupim/
    tar -vzxf flashplayer.tar.gz -C /opt/Chupim/tmp/flashplayer
    cd /opt/Chupim/tmp/flashplayer
    cp libflashplayer.so /usr/lib/mozilla/plugins/
    rm -R /opt/Chupim/tmp/flashplayer
    if [ -e /usr/lib/mozilla/plugins/libflashplayer.so ] ; then
	dialog --msgbox "Flash player INSTALADO COM SUCESSO." 5 70
	else
	dialog --msgbox "N�O FOI POSS�VEL INSTALAR Flash player, TENTE NOVAMENTE." 5 70
    fi
fi
exit
