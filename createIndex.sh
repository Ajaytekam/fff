#!/bin/bash 
####
# Create index file inside `out` directory
# ./createIndex.sh
####
YELLOWBOLD='\033[1;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -en "${YELLOWBOLD}[+] ${GREEN}Work in Progress${NC}\n"
cd out
for i in `ls`                       
do
    printf "${YELLOWBOLD}[+]${CYAN} %s\r" "${i}"
    cd $i 
    Status=`cat *.headers | egrep '< HTTP/1.1' | awk '{print $3}'` 
    for j in `ls`
    do
        echo "out/${i}/${j} [${Status}]" >> ../index  
    done
    cd ..
    printf "                                                    \r" 
done
cd ..
echo -en "${YELLOWBOLD}[*]${GREEN} Done!${NC}\n"
