SCRIPTV="0.1"

MYBASENAME=$( basename -- "$0"; )
MYDIRNAME=$( dirname -- "$0"; )
MYPWD=$( pwd; )

#echo "The script you are running has basename $MYBASENAME, and dirname $MYDIRNAME ";
#echo "The present working directory is $MYPWD";

echo "**************************************"
echo "Script version: $SCRIPTV"
echo "**************************************"

echo "Verifying if HELM and the kubernetes cluster is healthy and stable"

i=1
j=1
waittime=5
maxf=20
maxp=5

while true ; do

  	ready=`kubectl get pods -n kube-system | tail -n +2 | awk '{print $2}' | sort | uniq ` 
  	ready2=`kubectl get pods -n kube-system | grep tiller | awk '{print $2}' | sort | uniq ` 

	#echo "debug1 :: $ready"
	#echo "debug2 :: $ready2"

	if ! [[ "${ready2}" == "1/1" ]]; then
	
		i=0
    		echo "Tiller (HELM v2) pods not instantiated... :: Fail number $j out of $maxf"
		((j++))
		sleep $waittime

	elif [[ "${ready}" == "1/1" ]]; then

    		echo "All system pods are up and running. Waiting for stability : Pass number $i out of $maxp" 
		((i++))
		j=0
		sleep $waittime
  	else

    		echo "waiting for system pods to be ready :: Fail number $j out of $maxf"
		i=1
		((j++))
  		sleep $waittime
  	fi

	if [[ $i -ge $maxp ]]; then 

		echo "ALL GOOD on the system PODs"

		exit 0
	fi

	if [[ $j -ge $maxf ]]; then 

		echo "Problems with the system PODs"

		exit 1
	fi


done
