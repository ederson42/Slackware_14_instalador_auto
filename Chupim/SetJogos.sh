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
     --menu "\n$OPCAO JOGOS\n\
      \nPara voltar ao menu anterior aperte CANCEL.\n" 17 75 7 \
      "Supertux" "jogo 2D de c�digo aberto (parecido com Super Mario Bros)." \
      "Zsnes" " Emulador do V�deo-game Super Nintendo." \
      "Gens" "Emuladore para Genesis, Mega-Drive, Sega-CD e Mega-CD." \
      "Amoebax" "Puzzle de a��o." \
      "Xmoto" "Jogo de plataforma 2D de motocross." \
      "Wesnoth" "Jogo de estrat�gia baseado em turnos." \
      "Tubularix" "Jogo opensource similar ao Tetris." \
      "SecretMaryoChronicles" "Jogo de plataforma opensource." \
      "Briscola" "Jogo italiano de cartas." \
      "Ppsspp" "Emulador para PSP escrito em C++." \
      "Pokerth" "Jogo de poker single-player escrito em C++." \
      "Pingus" "Jogo opensource parecido com Lemmings." \
      "NeverNoid" "Jogo clone do Arkanoid." \
      "NeverBall" "Jogo 3D parecido com Marble Madness." \
      "KrossWordPuzzle" "Jogo de palavras cruzadas para KDE4." \
      "Krepton" "Jogo estilo arcade para KDE4." \
      "KbackGammon" "Jogo para KDE de gam�o." \
      "Dustrac" "Jogo de corrida Qt4 2D." \
      "AssaultCube" "Jogo 3D em primeira pessoa e multiplayer." \
      "SecondLife" "Mundo virtual desenvolvido pela Linden Lab." \
      "FlightGear" "Simulador de voo gratuito e super completo." \
      "MegaMario" "Um clone do  Mario Bros." \
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
	
	if [ "$REPLY" = "Voltar" ]; then
	exit
	fi
	
	/opt/Chupim/$chama
done