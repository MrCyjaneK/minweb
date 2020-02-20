#!/bin/bash
echo "HTTP/1.1 200 OK";
echo "Content-Type: text/html";
echo;
echo "<b>Hello World from bash</b><br /><pre>`ps | cat`</pre>";
