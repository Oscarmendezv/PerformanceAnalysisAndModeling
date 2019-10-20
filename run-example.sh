SERVER_HOST="10.10.16.147"
SERVER_PORT="12345"
LOCATION="/tmp"
THREADS=1
CLEAN=0
DOC_SIZE=16
FILE_SUFF=1

echo "* COPY JARS TO $SERVER_HOST"
scp ./jars/*.jar $SERVER_HOST:"$LOCATION/"

echo "* START SERVER ON $SERVER_HOST"
(ssh $SERVER_HOST "java -jar $LOCATION/WoCoServer.jar $SERVER_HOST $SERVER_PORT $CLEAN $THREADS") > ./server.log &

sleep 1

echo "* START CLIENT"
java -jar ./jars/WoCoClient.jar $SERVER_HOST $SERVER_PORT $DOC_SIZE 1 $FILE_SUFF > ./client.log

echo "* CLEANUP"
ssh $SERVER_HOST "killall java"

cat ./client.log
