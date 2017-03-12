#/bin/sh
echo ${1};
gimli -w '--toc --footer-right "[page]/[toPage]" --minimum-font-size 25 --page-size a2' -cover cover-file.md -f ${1}
