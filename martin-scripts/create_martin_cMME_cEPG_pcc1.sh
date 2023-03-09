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

echo "Creating a cMME and GW Controler"

cd /home/ericsson/5gc_files_pkg/config/martin-cmme-cepg-pcc-1/

kubectl create namespace martin-cmme-cepg-pcc-1

helm install --name martin-cmme-cepg-pcc-1 --namespace martin-cmme-cepg-pcc-1 -f values.yaml --set mme.redis.imageCredentials.registry.url="docker.io" --set-file mme.nc.configMap=config-mme.cfg --set-file eric-epg.eric-pccsm-controller.controller.configMap=config-epg.xml ~/PCC_1_Drop_13/eric-pc-controller-1.6.0-10.tgz

echo
echo "Your PCC initialization via HELM has been initiated"

echo
echo "You can monitor the pods that have containers in NOT READY state via the following command: watch -d \"kubectl get pod --all-namespaces |grep -Pv '\s+([1-9]+)\/\1\s+' \"  "
