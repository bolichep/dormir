nc -l -w 1 -u 0.0.0.0 9 | awk '$0 ~ /exit/ {system("shutdown -h now")}'
