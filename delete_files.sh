#!/bin/bash
   find ~/Documents/ -type f -not \( -name '*.sh' -or -name '*.py' -or -name '*.desktop' \) -delete
   find ~/Downloads/ -type f -not \( -name '*.sh' -or -name '*.py' -or -name '*.desktop' \) -delete
   find ~/Pictures/ -type f -not \( -name '*.sh' -or -name '*.py' -or -name '*.desktop' \) -delete
   find ~/Videos/ -type f -not \( -name '*.sh' -or -name '*.py' -or -name '*.desktop' \) -delete
   find ~/Music/ -type f -not \( -name '*.sh' -or -name '*.py' -or -name '*.desktop' \) -delete
   find ~/Desktop/ -type f -not \( -name '*.sh' -or -name '*.py' -or -name '*.desktop' \) -delete
   find ~/Public/ -type f -not \( -name '*.sh' -or -name '*.py' -or -name '*.desktop' \) -delete
   
  #Claer cache of WPS_Office
   find ~/.local/share/Kingsoft/office6/data/backup/ -type f -not \( -name '*.sh' -or -name '*.py' -or -name '*.desktop' \) -delete
   
   find ~/Документы/ -type f -not \( -name '*.sh' -or -name '*.py' -or -name '*.desktop' \) -delete
   find ~/Загрузки/ -type f -not \( -name '*.sh' -or -name '*.py' -or -name '*.desktop' \) -delete
   find ~/Изображения/ -type f -not \( -name '*.sh' -or -name '*.py' -or -name '*.desktop' \) -delete
   find ~/Видео/ -type f -not \( -name '*.sh' -or -name '*.py' -or -name '*.desktop' \) -delete
   find ~/Музыка/ -type f -not \( -name '*.sh' -or -name '*.py' -or -name '*.desktop' \) -delete
   find ~/Рабочий\ стол/ -type f -not \( -name '*.sh' -or -name '*.py' -or -name '*.desktop' \) -delete
