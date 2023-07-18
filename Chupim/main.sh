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
    echo "######---->ATENÇÃO!!!!! Sem conexão com a internet!<----######" > /opt/Chupim/tmp/TesteInt
   else
    echo "Conectado à Internet!" > /opt/Chupim/tmp/TesteInt
   fi
while [ 0 ]; do
  mensagem="$(cat /opt/Chupim/tmp/TesteInt)"
     dialog --title "BEM-VINDO ao gerenciador CHUPIM" \
     --menu "\nEscolha uma das opções para começar.\n\
      \n$mensagem\n" 17 75 7 \
      "Instalar" "Adicionar programas em seu sistma" \
      "Desinstalar" "Remover programas ou pacotes (individuais)" \
      "pkgtool" "Abrir o gerenciador de pacotes padrão do Slackware" \
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
