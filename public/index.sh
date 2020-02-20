#!/bin/bash
echo "HTTP/1.1 200 OK";
echo "Content-Type: text/html";
echo;

echo "Hello. <br />"
echo "Check check my scripts!<br />"

for i in *;
do
    echo " > <a href=\"/$i\">$i</a><br />";
done

echo "Debug info: <br />";

in="`timeout 1 tee`"; 

for p in ${QUERY//&/ };
do
    kvp=( ${p/=/ } ); 
    k="GET_"${kvp[0]};
    v=${kvp[1]};
    eval $k=$v;
done

echo $GET_a;
echo "$in" | sed ':a;N;$!ba;s#\n#<br />#g;s#^<br />##g';
