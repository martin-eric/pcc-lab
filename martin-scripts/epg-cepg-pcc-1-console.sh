kubectl exec -it -n martin-cmme-cepg-pcc-1 $(kubectl get pod -n martin-cmme-cepg-pcc-1 | grep controller | awk '{print $1}' ) -c confd cli_ss

