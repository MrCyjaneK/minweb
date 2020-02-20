#echo "HTTP/1.1 200 OK";
#echo "Content-Type: text/plain";
#echo "Content-Type: text/html";
#echo;

# That timeout is important.. leave it there
input=`timeout 1 tee`;

#echo "============="
#echo "$input";
#echo "============="
#echo;
reqpath="`pwd`/public""$(echo "`echo \"$input\" | head -n 1`" | awk '{print $2}')";
#echo "reqpath: $reqpath"
if [[ -d "$reqpath" ]]; then
    reqpath="$reqpath""index.sh"
#    echo "    > $reqpath"
fi;
reqpath="$(echo "$reqpath" | cut -f1 -d'?' | cut -f1 -d'#' )"
path="$(dirname "$reqpath")"
cd "$path"
filename=$(basename -- "$reqpath")
extension="${filename##*.}"
filename="${filename%.*}"
if [[ -f "$reqpath" ]];
then
    ext=`echo "$extension" | awk '{print tolower($0)}'`
    if [[ "$ext" == "sh" ]];   then echo "$input" | sh "$reqpath"; fi
    if [[ "$ext" == "bash" ]]; then echo "$input" | bash "$reqpath"; fi
    if [[ "$ext" == "php" ]];  then echo "$input" | php "$reqpath"; fi
    if [[ "$ext" == "pas" ]];  then fpc -v0 -o"/tmp/$filename" "$reqpath" &>/dev/null && "/tmp/$filename"; rm "/tmp/$filename*"; fi
else
    echo "HTTP/1.1 404 NOT_FOUND";
    echo "Content-Type: text/plain";
    echo;
    echo "404 - UnusedSpace - mrcyjanek.net minimal web hosting script."
    echo "$reqpath"
    exit 0;
fi;


#echo "Server: $SOCAT_SOCKADDR:$SOCAT_SOCKPORT";
#echo "Client: $SOCAT_PEERADDR:$SOCAT_PEERPORT";
