kubectl exec -it -n martin-pgw-pcg-1 $(kubectl get pod -n martin-pgw-pcg-1 | grep pcgup | awk '{print $1}' ) -c martin-pgw-pcg-1-eric-pcgup-data-plane bdcu "show upf"
