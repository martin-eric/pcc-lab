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

echo "Deleting all HELM releases named martin"

for i in `helm list | grep martin | awk '{print $1}'` ; do echo "Deleting HELM RELEASE $i" ; helm del --purge $i ; done
while kubectl get pods --all-namespaces | grep martin | grep -i terminating 
do
echo "Waiting for all pods to terminate successfully..."
sleep 5
done
for j in `kubectl get ns | grep martin | awk '{print $1}'` ; do echo "Deleting NAMESPACE $j" ; kubectl delete ns $j ; done


echo "FINISHED Deleting all HELM releases named martin"
