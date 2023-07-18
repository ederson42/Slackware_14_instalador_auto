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
nomeprog=$(cat /opt/Chupim/tmp/reply)

dialog --yesno "Gostaria de INSTALAR $nomeprog?" 0 0
if [ $? = 0 ]; then
if [ -e /opt/Chupim/tmp/$nomeprog ] ; then
  rm -R /opt/Chupim/tmp/$nomeprog
fi
######################### VERIFICA SE O PACOTE J� EXISTE ######################
    for linha in $(cat /opt/Chupim/instalar/$nomeprog); do echo "" ;
    if [ -e /var/log/packages/"$linha" ] ; then
	echo ""
	echo "+=============================================================================="
	echo "| PACOTE $linha INSTALADO..."
	echo "+=============================================================================="
	echo ""    
	else
	    echo ""
	    echo "+=============================================================================="
	    echo "| PACOTE $linha N�O INSTALADO..."
	    echo "+=============================================================================="
	    echo ""
	    baixa=$(cat /opt/Chupim/pacotes/$linha)
	    wget -r -nd -P /opt/Chupim/tmp/$nomeprog $baixa
	  
    fi
    done < /opt/Chupim/instalar/$nomeprog

    ######################### FIM VERIFICA SE O PACOTE J� EXISTE ######################

    ######################## INSTALA PACOTES SELECIONADOS #############################

    upgradepkg --install-new /opt/Chupim/tmp/$nomeprog/*

    ######################## FIM INSTALA PACOTES SELECIONADOS #############################


    rm -R /opt/Chupim/tmp/$nomeprog

    dialog --msgbox "$nomeprog INSTALADO COM SUCESSO." 5 70
    fi
 else
    dialog --msgbox "O programa $nomeprog n�o ser� instalado!" 5 70
fi