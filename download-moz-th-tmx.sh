#!/bin/sh

TMX_PATH=$(curl 'https://transvision.mozfr.org/downloads/?locale=th&tmx_format=normal&gecko_strings=gecko_strings&firefox_ios=firefox_ios&mozilla_org=mozilla_org' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Accept-Language: th,en-US;q=0.7,en;q=0.3' --compressed -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Referer: https://transvision.mozfr.org/downloads/' -H 'Upgrade-Insecure-Requests: 1'  | ruby -ne 'puts $1 if /(\/download\/moz.+\.tmx)/')
URL="https://transvision.mozfr.org$TMX_PATH"
echo $URL
PREFIX=corpus/moz
mkdir -p $PREFIX
MOZBASE=$(basename $TMX_PATH)
curl $URL > $PREFIX/$MOZBASE

