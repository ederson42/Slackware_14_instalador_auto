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
if [ -e /usr/lib/jvm/java-8-oracle ] ; then
      dialog --msgbox "Java J� EST� INSTALADO EM SEU SISTEMA." 5 70
    else
    cd /opt/Chupim/
    tar xzf jre-8u5-linux-i586.tar.gz

    caminho=/usr/lib/jvm
    if [ ! -d "$caminho" ]; then
      mkdir /usr/lib/jvm
    fi

    mv jre1.8.0_05 /usr/lib/jvm

    cd /usr/lib/jvm/

    ln -s jre1.8.0_05 java-8-oracle
    dialog --msgbox "Java INSTALADO COM SUCESSO." 5 70
fi
exit