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
if [ -e /usr/lib/jvm/java-8-oracle ] ; then
      dialog --msgbox "Java JÁ ESTÁ INSTALADO EM SEU SISTEMA." 5 70
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