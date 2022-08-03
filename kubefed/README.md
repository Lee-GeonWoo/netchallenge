# After change your own config
 ex) cluster1(host), cluster2(member)
```
$ systemctl daemon-reload
$ systemctl restart kubelet
$ kubectl config get-contexts
```

### Change cluster's name to clusterN 

$ for i in {1..n} do
$ kubefedctl join cluster1 --cluster-context cluster${i} --host-cluster-context cluster${i} --kubefed-namespace=kube-federation-system --v=2      # join host and member cluster to host cluster
$ done

$ kubectl -n kube-federation-system get kubefedclusters
```
