[ -z "$1" ] && echo -e "\x1B[01;31mError: No SSH address given.\x1B[0m" && exit 1;

# remote PORT can be set via ENV or defaults to 5678
if [[ "${PORT:-0}" = "0" ]]; then
  PORT=5678
fi

ssh -CL 0.0.0.0:18083:127.0.0.1:$PORT -L 0.0.0.0:3389:127.0.0.1:3389  -L 0.0.0.0:3390:127.0.0.1:3390 -L 0.0.0.0:3391:127.0.0.1:3391 $1 "killall vboxwebsrv && vboxwebsrv -p $PORT -A null -t 0"