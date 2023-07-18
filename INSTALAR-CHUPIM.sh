#!/bin/bash
arq="$(uname -m)"

if [ -e /usr/bin/chupim ] ; then
   rm -f /usr/bin/chupim
    else
    if [ "$arq" = "i386" ] || [ "$arq" = "i486" ] || [ "$arq" = "i586" ] || [ "$arq" = "i686" ] ; then
      cp -R Chupim/ /opt/ | ln -s /opt/Chupim/main.sh /usr/bin/chupim
       dialog --yesno "Quer criar um �cone do CHUPIM?" 0 0
	    if [ $? = 0 ]; then
	    diretorio=$( dialog --stdout --inputbox 'Digite o local para criar o �cone (exemplo: /home/user/Desktop):' 0 0 )
	    if [ -e $diretorio ] ; then
		touch $diretorio/Chupim.desktop
		chmod +x $diretorio/Chupim.desktop
		echo "[Desktop Entry]" > $diretorio/Chupim.desktop
		echo "Name=Chupim" >> $diretorio/Chupim.desktop
		echo "Type=Application" >> $diretorio/Chupim.desktop
		echo "Exec=/usr/bin/chupim" >> $diretorio/Chupim.desktop
		echo "Terminal=true" >> $diretorio/Chupim.desktop
		echo "Icon=/opt/Chupim/iconchupim.png" >> $diretorio/Chupim.desktop
		dialog --msgbox "CHUPIM INSTALADO COM SUCESSO." 5 70
	    else
	    dialog --msgbox "O local $diretorio n�o consta no sistema. O �cone n�o foi criado." 5 70
	    fi
	    else
		dialog --msgbox "O �cone do CHUPIM n�o ser� criado!" 5 70
		dialog --msgbox "CHUPIM INSTALADO COM SUCESSO." 5 70
	    fi
      
      else
      dialog --msgbox "Seu sistema Slackware n�o � 32 bits, baixe o CHUPIM vers�o 64 bits." 5 70
      exit
    fi
fi
