#!/bin/bash
PORT=80
socat \
    -v -d -d \
    TCP-LISTEN:$PORT,crlf,reuseaddr,fork \
    EXEC:"bash server.sh"
