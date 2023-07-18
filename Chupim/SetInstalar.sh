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
nomeprog=$(cat /opt/Chupim/tmp/reply)

dialog --yesno "Gostaria de INSTALAR $nomeprog?" 0 0
if [ $? = 0 ]; then
if [ -e /opt/Chupim/tmp/$nomeprog ] ; then
  rm -R /opt/Chupim/tmp/$nomeprog
fi
######################### VERIFICA SE O PACOTE JÁ EXISTE ######################
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
	    echo "| PACOTE $linha NÃO INSTALADO..."
	    echo "+=============================================================================="
	    echo ""
	    baixa=$(cat /opt/Chupim/pacotes/$linha)
	    wget -r -nd -P /opt/Chupim/tmp/$nomeprog $baixa
	  
    fi
    done < /opt/Chupim/instalar/$nomeprog

    ######################### FIM VERIFICA SE O PACOTE JÁ EXISTE ######################

    ######################## INSTALA PACOTES SELECIONADOS #############################

    upgradepkg --install-new /opt/Chupim/tmp/$nomeprog/*

    ######################## FIM INSTALA PACOTES SELECIONADOS #############################


    rm -R /opt/Chupim/tmp/$nomeprog

    dialog --msgbox "$nomeprog INSTALADO COM SUCESSO." 5 70
    fi
 else
    dialog --msgbox "O programa $nomeprog não será instalado!" 5 70
fi