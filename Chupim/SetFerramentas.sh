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
while [ 0 ]; do
OPCAO="$(cat /opt/Chupim/tmp/opcao)"
dialog --title "Gerenciador CHUPIM" \
     --menu "\n$OPCAO FERRAMENTAS DE SISTEMA\n\
      \nPara voltar ao menu anterior aperte CANCEL.\n" 17 75 7 \
      "Gparted" "Aplicativo GNOME para edição de partições." \
      "VirtualBox" "Visa criar ambientes para instalação de sistemas distintos." \
      "P7zip" "Compactador de arquivos com alta taxa de compressão." \
      "RecordMyDesktop" "Gravador de Desktop para GNU/Linux." \
      "Wine" "Camada de compatibilidade para sistemas UNIX da API do Windows." \
      "TeamViewer" "Pacote de software proprietário para acesso remoto." \
      "LibreOffice" "Suíte de aplicativos livre multiplataforma para escritório." \
      "UnetBootin" "Programa que permite a criação de sistemas Live USB." \
      "Samba" "Gerenciamento e compartilhamento de arquivos em uma rede Microsoft." \
      "Mysql" "Sistema de gerenciamento de banco de dados." \
      "Btmgr-3.7" "Pequeno e poderoso gerenciador de boot." \
      "Grub2" "Sistema de gerenciamento de banco de dados (versão 2)." \
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
              dialog --msgbox "VirtualBox JÁ ESTÁ INSTALADO EM SEU SISTEMA." 5 70
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