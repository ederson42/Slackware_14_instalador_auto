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
while [ 0 ]; do
OPCAO="$(cat /opt/Chupim/tmp/opcao)"
dialog --title "Gerenciador CHUPIM" \
     --menu "\n$OPCAO FERRAMENTAS DE SISTEMA\n\
      \nPara voltar ao menu anterior aperte CANCEL.\n" 17 75 7 \
      "Gparted" "Aplicativo GNOME para edi��o de parti��es." \
      "VirtualBox" "Visa criar ambientes para instala��o de sistemas distintos." \
      "P7zip" "Compactador de arquivos com alta taxa de compress�o." \
      "RecordMyDesktop" "Gravador de Desktop para GNU/Linux." \
      "Wine" "Camada de compatibilidade para sistemas UNIX da API do Windows." \
      "TeamViewer" "Pacote de software propriet�rio para acesso remoto." \
      "LibreOffice" "Su�te de aplicativos livre multiplataforma para escrit�rio." \
      "UnetBootin" "Programa que permite a cria��o de sistemas Live USB." \
      "Samba" "Gerenciamento e compartilhamento de arquivos em uma rede Microsoft." \
      "Mysql" "Sistema de gerenciamento de banco de dados." \
      "Btmgr-3.7" "Pequeno e poderoso gerenciador de boot." \
      "Grub2" "Sistema de gerenciamento de banco de dados (vers�o 2)." \
      "Grub" "Multi-carregador de um sistema operacional." \
      "Voltar" "Voltar ao menu anterior." 2> /opt/Chupim/tmp/reply

      if [ ! $? = 0 ]; then
      rm -f /opt/Chupim/tmp/reply
      dialog --clear
      exit
      fi
      
      REPLY="$(cat /opt/Chupim/tmp/reply)"
      
      if [ "$OPCAO" = "INSTALAR" ]; then
	  chama="SetInstalar.sh"
	  else
	  chama="SetDesinstalar.sh"
      fi
	
if [ "$REPLY" = "VirtualBox" ]; then
    if [ "$OPCAO" = "INSTALAR" ]; then
	if [ -e /usr/bin/virtualbox ] ; then
              dialog --msgbox "VirtualBox J� EST� INSTALADO EM SEU SISTEMA." 5 70
              exit
	fi
	/opt/Chupim/VirtualBox.run
    else
        /opt/Chupim/VirtualBox.run uninstall
    fi
else
	if [ "$REPLY" = "Voltar" ]; then
	exit
	fi
	/opt/Chupim/$chama
fi
done