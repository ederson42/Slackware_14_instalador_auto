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
    dialog --yesno "Realmente quer DESINSTALAR Java?" 0 0
        if [ $? = 0 ]; then
        rm -rf /usr/lib/jvm/java-8-oracle
        dialog --msgbox "Java DESINSTALADO COM SUCESSO." 5 70
        else
	    dialog --msgbox "O programa Java n�o ser� desinstalado!" 5 70
        fi
    
    else
        dialog --msgbox "Java N�O CONSTA EM SEU SISTEMA." 5 70
fi