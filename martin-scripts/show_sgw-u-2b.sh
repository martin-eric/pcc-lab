kubectl exec -it -n rp-pcg-2b $(kubectl get pod -n rp-pcg-2b | grep pcgup | awk '{print $1}' ) -c rp-pcg-2b-eric-pcgup-data-plane bdcu "show upf"
