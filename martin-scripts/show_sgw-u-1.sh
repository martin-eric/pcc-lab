kubectl exec -it -n martin-sgw-pcg-1 $(kubectl get pod -n martin-sgw-pcg-1 | grep pcgup | awk '{print $1}' ) -c martin-sgw-pcg-1-eric-pcgup-data-plane bdcu "show upf"
