SCRIPTV="1.1"
MYBASENAME=$( basename -- "$0"; )
MYDIRNAME=$( dirname -- "$0"; )
MYPWD=$( pwd; )

#echo "The script you are running has basename $MYBASENAME, and dirname $MYDIRNAME ";
#echo "The present working directory is $MYPWD";

echo "**************************************"
echo "Script name: $MYBASENAME"
echo "Script version: $SCRIPTV"
echo "**************************************"

echo "Creating a cMME and GW Controler and PCG with sgw and pgw functionality"

./create_martin_cMME_cEPG_pcc1.sh
sleep 15
./create_martin_pgw-u-1.sh
sleep 15
./create_martin_sgw-u-1.sh

