SERVER_HOST="127.0.0.1"
SERVER_PORT="12347"
LOCATION="jars"
THREADS=1
CLEAN=0
DOC_SIZE=16
FILE_SUFF=1

#echo "* COPY JARS TO $SERVER_HOST"
#scp ./jars/*.jar $SERVER_HOST:"$LOCATION/"

echo "* START SERVER ON $SERVER_HOST"
java -jar $LOCATION/WoCoServer.jar $SERVER_HOST $SERVER_PORT $CLEAN $THREADS > ./server.log &

sleep 1

echo "* START CLIENT"
java -jar ./jars/WoCoClient.jar $SERVER_HOST $SERVER_PORT $DOC_SIZE 10 $FILE_SUFF > ./client.log

echo "* CLEANUP"
#killall java

cat ./client.log
