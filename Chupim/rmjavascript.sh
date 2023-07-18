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
    dialog --yesno "Realmente quer DESINSTALAR Java?" 0 0
        if [ $? = 0 ]; then
        rm -rf /usr/lib/jvm/java-8-oracle
        dialog --msgbox "Java DESINSTALADO COM SUCESSO." 5 70
        else
	    dialog --msgbox "O programa Java não será desinstalado!" 5 70
        fi
    
    else
        dialog --msgbox "Java NÃO CONSTA EM SEU SISTEMA." 5 70
fi