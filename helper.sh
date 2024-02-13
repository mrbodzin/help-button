#!/bin/bash
export LANGUAGE=en_US.UTF-8
Y=$(echo $(($(xrandr | awk '/Screen/{print$10}' | tr -d ,)/2)))
X=$(echo $(($(xrandr | awk '/Screen/{print$8}')/3)))
yad --title=Help\ Buttons\ by\ bodzin --form --width=450 --text="Choose a problem:" --field="The internet is slow or not working.":fbtn "bash -c 'echo 'i=1'  > .tmp && killall yad'" --field="Routing sound through Jabra headset.":fbtn "bash -c 'echo 'i=2' > .tmp && killall yad'" --field="Route sound through Sennheiser headset.":fbtn "bash -c 'echo 'i=3' > .tmp && killall yad'" --field="Output sound through laptop speakers.":fbtn "bash -c 'echo 'i=4' > .tmp && killall yad'" --field="Output sound through HDMI":fbtn "bash -c 'echo 'i=5' > .tmp && killall yad'" --field="Issues with accessing websites.":fbtn "bash -c 'echo 'i=6' > .tmp && killall yad'" --field="COPY FOR ADMINS: Computer ID and IP Address":fbtn "bash -c 'echo 'i=7' > .tmp && killall yad'" --field="Clean your PC from files":fbtn "bash -c 'echo 'i=8'  > .tmp && killall yad'" --button=gtk-cancel:1 --posx=$X --posy=$Y --buttons-layout=end 
. .tmp
rm .tmp


if [[ "$i" = "1" ]]
 then
  sudo /root/.scr/./fix_wifi.sh
elif [[ "$i" = "2" ]]
 then
  Jabra_d_si=$(pactl list sinks short | awk '/Jabra/{print$1}'); pacmd set-default-sink $Jabra_d_si
  Jabra_d_so=$(pactl list sources short | awk '/alsa_input/' | awk '/Jabra/{print$1}'); pacmd set-default-source $Jabra_d_so
  Jabra=$(pactl list cards short | awk '/Jabra/{print$1}'); pactl set-card-profile $Jabra output:analog-stereo+input:analog-mono
  Intel=$(pactl list cards | grep  "alsa.card_name.*PCH" -B 6 | cut -d \# -f 2 | head -1); pactl set-card-profile $Intel off
  JabraSINK=$(pactl list sinks short | awk '/Jabra/{print$1}'); pactl set-sink-mute $JabraSINK false ; pactl set-sink-volume $JabraSINK 100%
  JabraSOURCE=$(pactl list sources short | awk '/alsa_input/' | awk '/Jabra/{print$1}'); pactl set-source-mute $JabraSOURCE false ; pactl set-source-volume $JabraSOURCE 70%
elif [[ "$i" = "3" ]]
 then
  Sennheiser_d_si=$(pactl list sinks short | awk '/Sennheiser/{print$1}'); pacmd set-default-sink $Sennheiser_d_si
  Sennheiser_d_so=$(pactl list sources short | awk '/alsa_input/' | awk '/Sennheiser/{print$1}'); pacmd set-default-source $Sennheiser_d_so
  Sennheiser=$(pactl list cards short | awk '/Sennheiser/{print$1}'); pactl set-card-profile $Sennheiser output:analog-stereo+input:analog-mono
  Intel=$(pactl list cards | grep  "alsa.card_name.*PCH" -B 6 | cut -d \# -f 2 | head -1); pactl set-card-profile $Intel off
  SennheiserSINK=$(pactl list sinks short | awk '/Sennheiser/{print$1}'); pactl set-sink-mute $SennheiserSINK false ; pactl set-sink-volume $SennheiserSINK 100%
  SennheiserSOURCE=$(pactl list sources short | awk '/alsa_input/' | awk '/Sennheiser/{print$1}'); pactl set-source-mute $SennheiserSOURCE false ; pactl set-source-volume $SennheiserSOURCE 70%
elif [[ "$i" = "4" ]]
 then
  Intel_d_si=$(pactl list sinks short | awk '/pci/{print$1}'); pacmd set-default-sink $Intel_d_si
  Intel_d_so=$(pactl list sources short | awk '/pci/{print$1}'); pacmd set-default-source $Intel_d_so
  Intel=$(pactl list cards | grep  "alsa.card_name.*PCH" -B 6 | cut -d \# -f 2 | head -1); pactl set-card-profile $Intel output:analog-stereo+input:analog-stereo
  Sennheiser=$(pactl list cards short | awk '/Sennheiser/{print$1}'); pactl set-card-profile $Sennheiser off 
  Jabra=$(pactl list cards short | awk '/Jabra/{print$1}'); pactl set-card-profile $Jabra off
  IntelSINK=$(pactl list sinks short | awk '/pci/{print$1}'); pactl set-sink-mute $IntelSINK false ; pactl set-sink-volume $IntelSINK 100%
  IntelSOURCE=$(pactl list sources short | awk '/alsa_input/' | awk '/pci/{print$1}'); pactl set-source-mute $IntelSOURCE false ; pactl set-source-volume $IntelSOURCE 20% | pactl set-default-source $IntelSOURCE
elif [[ "$i" = "5" ]]
 then
  Intel_d_si=$(pactl list sinks short | awk '/pci/{print$1}'); pacmd set-default-sink $Intel_d_si
  Intel_d_so=$(pactl list sources short | awk '/pci/{print$1}'); pacmd set-default-source $Intel_d_so
  HDMI=$(pactl list cards short | awk '/pci/{print$1}'); pactl set-card-profile $HDMI output:hdmi-stereo+input:analog-stereo
  IntelSINK=$(pactl list sinks short | awk '/pci/{print$1}'); pactl set-sink-mute $IntelSINK false ; pactl set-sink-volume $IntelSINK 100%
  IntelSOURCE=$(pactl list sources short | awk '/alsa_input/' | awk '/pci/{print$1}'); pactl set-source-mute $IntelSOURCE false ; pactl set-source-volume $IntelSOURCE 100%
elif [[ "$i" = "6" ]]
 then
  google-chrome "https://jira.yourdomain.com"
elif [[ "$i" = "7" ]]
 then
 hostID=$(echo $HOSTNAME && ifconfig | awk '/inet/{print$2}' | awk '/192/')
 echo $hostID | xclip -sel clip
elif [[ "$i" = "8" ]]
 then
  /root/.scr/delete_files.sh
fi
