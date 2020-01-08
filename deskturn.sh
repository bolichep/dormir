#!/bin/bash

function mac(){
    mac=(d0 17 c2 9c 16 72)
    for c in ${mac[@]}; do echo -n "0x$c "; done
}
function shutdown(){
    exit=(65 78 69 74)
    for c in ${exit[@]}; do echo -n "0x$c "; done
}
function magicPacket(){
    for(( i=0; i<6; i++)) do echo -n "0xff "; done 
    for(( i=0; i<16; i++)) do mac; done;
}
function magicPacketAndShutdown(){
    magicPacket
    shutdown
}    

# magicPacketAndShutdown generate a string of hexas 6 ff and 16 times mac
# plus hexa for 'exit' string
# xxd tranform the string of hexas in 106 (-c) raw (-r) bytes
# nc broadcast (-b & 255...) the raw (|) over UDP (-u) to port 9, wait (-w) 1seg
# all this can be debugged with tcpdump -nnSX port 9
magicPacketAndShutdown | xxd -c 106 -r | nc -w 1 -b -u 255.255.255.255 9
