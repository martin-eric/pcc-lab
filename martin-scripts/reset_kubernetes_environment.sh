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

echo "Resetting Kubernetes + docker + iptables"


yes | sudo kubeadm reset
sudo systemctl stop kubelet
sudo rm -rf /var/lib/cni/
sudo rm -rf /var/lib/kubelet/*
sudo rm -rf /etc/cni/
sudo ifconfig cni0 down
sudo ifconfig flannel.1 down
sudo ifconfig docker0 down
sudo ip link delete cni0
sudo ip link delete flannel.1
sudo iptables -F
sudo iptables -t nat -F
sudo iptables -t mangle -F 
sudo iptables -X

echo

echo "doing a bit of cleanup in the hostpath provisionner"

sudo rm -rf /tmp/hostpath-provisioner/*

echo
echo "it is RECOMMENDED that you reboot your node"
