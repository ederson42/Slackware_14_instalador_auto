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

#script.sh
Login(){
if [ "$(id -u)" != "0" ]; then
echo
echo -n "Digite a senha root - "
su -c "sh /opt/Chupim/main.sh"
#su - root -c "sh /opt/Chupim/main.sh
else
echo "Instalando, aguarde..."
fi
}

Login
if ! ping -c 1 www.google.com ; then
    echo "######---->ATEN��O!!!!! Sem conex�o com a internet!<----######" > /opt/Chupim/tmp/TesteInt
   else
    echo "Conectado � Internet!" > /opt/Chupim/tmp/TesteInt
   fi
while [ 0 ]; do
  mensagem="$(cat /opt/Chupim/tmp/TesteInt)"
     dialog --title "BEM-VINDO ao gerenciador CHUPIM" \
     --menu "\nEscolha uma das op��es para come�ar.\n\
      \n$mensagem\n" 17 75 7 \
      "Instalar" "Adicionar programas em seu sistma" \
      "Desinstalar" "Remover programas ou pacotes (individuais)" \
      "pkgtool" "Abrir o gerenciador de pacotes padr�o do Slackware" \
      "Ajuda" "Ler o manual do gerenciador CHUPIM" \
      "Sair" "Sair do gerenciador" 2> /opt/Chupim/tmp/reply

      if [ ! $? = 0 ]; then
      rm -f /opt/Chupim/tmp/reply
      dialog --clear
      exit
      fi
      
      REPLY="$(cat /opt/Chupim/tmp/reply)"
      
	if [ "$REPLY" = "Instalar" ]; then
	echo "INSTALAR" > /opt/Chupim/tmp/opcao
	/opt/Chupim/SetEscolha.sh
	fi 

	if [ "$REPLY" = "Desinstalar" ]; then
	echo "DESINSTALAR" > /opt/Chupim/tmp/opcao
	/opt/Chupim/SetEscolha.sh
	fi  

	if [ "$REPLY" = "pkgtool" ]; then
	pkgtool
	fi
	
	if [ "$REPLY" = "Ajuda" ]; then
        /opt/Chupim/SetAjuda.sh
	fi
	
	if [ "$REPLY" = "Sair" ]; then
	rm -f /opt/Chupim/tmp/reply
	break
	fi
done
#dialog --msgbox "######-----OBRIGADO POR UTILIZAR O INSTALADOR CHUPIM!-----########" 5 70
rm -f /opt/Chupim/tmp/TesteInt
rm -f /opt/Chupim/tmp/opcao
