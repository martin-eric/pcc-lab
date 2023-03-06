kubectl exec -it -n rp-pcg-1b $(kubectl get pod -n rp-pcg-1b | grep pcgup | awk '{print $1}' ) -c rp-pcg-1-eric-pcgup-data-plane bdcu "show upf"
