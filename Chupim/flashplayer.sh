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
if [ -e /usr/lib/mozilla/plugins/libflashplayer.so ] ; then
      dialog --msgbox "Flash player JÁ ESTÁ INSTALADO EM SEU SISTEMA." 5 70
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
	dialog --msgbox "NÃO FOI POSSÍVEL INSTALAR Flash player, TENTE NOVAMENTE." 5 70
    fi
fi
exit
