# Dormir

## scripts para despertar y dormir una maquina a traves del paquete magico en el puerto 9 (discard)

*deskturn.sh* : es un script que es corrido en el cliente. Este despierta la maquina server si esta dormida o la duerme si esta despierta

*dormir.sh* : es un escript que se instala en el server y es invocado por el archivo de configuracion de unidad (systemd) *dormir.service*

*dormir.service* : archivo de configuracion de unidad que una vez instalado determina el uso de *dormir.sh*

## debug

para debugear el funcionamiento de estos script es muy util:

```bash
# tcpdump -nnSX port 9
```
