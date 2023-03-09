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

echo "Removing nf with names martin"
$MYPWD/delete_nf_martin.sh

sleep 5

echo "Resetting Kubernetes cluster"
$MYPWD/reset_kubernetes_environment.sh

sleep 10

echo "Powering off the VM"
sudo poweroff


