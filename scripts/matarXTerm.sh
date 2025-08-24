#!/bin/bash
for pid in $(pgrep xterm); do
    pkill -INT -P $pid
done


sleep 10


pkill xterm
