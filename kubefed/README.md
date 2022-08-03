# After change your own config
 ex) cluster1(host), cluster2(member)
```
$ systemctl daemon-reload
$ systemctl restart kubelet
$ kubectl config get-contexts
```

## Change cluster's name to clusterN 
```
$ vi /root/.kube/config
```

### config example
```
host cluster = cluster1
member cluster = cluster2
############################################################
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: REDACTED
    server: https://{host-cluster ip address}:6443
  name: host-cluster
- cluster:
    certificate-authority-data: REDACTED
    server: https://{member-cluster ip address}:6443
  name: member-cluster

contexts:
- context:
    cluster: host-cluster
    user: host-cluster-admin
  name: cluster1
- context:
    cluster: member-cluster
    user: member-cluster-admin
  name: cluster2

current-context: cluster1

kind: Config
preferences: {}

users:
- name: host-cluster-admin
  user:
    client-certificate-data: REDACTED
    client-key-data: REDACTED
- name: member-cluster-admin
  user:
    client-certificate-data: REDACTED
    client-key-data: REDACTED
```


```
$ for i in {1..n} do
$ kubefedctl join cluster1 --cluster-context cluster${i} --host-cluster-context cluster${i} --kubefed-namespace=kube-federation-system --v=2      # join host and member cluster to host cluster
$ done

$ kubectl -n kube-federation-system get kubefedclusters
```
