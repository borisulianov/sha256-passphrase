#!/bin/bash 

which xclip > /dev/null
status="$?"

if [ $status -eq 0 ]
  then

  echo "Escriba su frase o palabra clave. El hash se copiará al portapapeles."
  echo -n "¿Clave? > "
  read -s text

  if [ "$text" ]
  then
    echo -n "Procesando..."  
    hashoutput=$(echo -n "$text" | sha256sum)
    MyOutput=${hashoutput:0:64}
    echo -n "$MyOutput" | xclip -selection clipboard
    sleep 3s
    echo "¡Listo!"
  else  
    echo "¡No se ha ingresado texto!"
  fi
else
  echo "Al parecer la aplicación xclip no está instalada."
  echo "Para instalarla ejecute:"
  echo "    sudo apt-get install xclip"
fi
