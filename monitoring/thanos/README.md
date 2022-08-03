# thanos
Kubernetes multi-cluster monitoring

## Edge-cluster
```
$ kubectl create ns monitoring
```

Change Value Like data-producer-1,2,...
```
$ helm install kube-prometheus bitnami/kube-prometheus --set prometheus.thanos.create=true --set operator.service.type=ClusterIP --set prometheus.service.type=ClusterIP --set alertmanager.service.type=ClusterIP --set prometheus.thanos.service.type=LoadBalancer --set prometheus.externalLabels.cluster="data-producer-1" -n monitoring
```

## Core-cluster
```
$ git clone https://github.com/59nezytic/thanos.git
```
```
$ cd thanos
```

Edit values.yaml for your own settings. <YOUR_EDGE_MASTER_1_IP>
```
$ kubectl create ns monitoring
```
```
$ helm install kube-prometheus bitnami/kube-prometheus --set prometheus.thanos.create=true --set operator.service.type=ClusterIP --set prometheus.service.type=ClusterIP --set alertmanager.service.type=ClusterIP --set prometheus.thanos.service.type=LoadBalancer -n monitoring
```
```
$ helm install grafana bitnami/grafana --set service.type=NodePort --set admin.password=<YOUR_PASSWORD> --set persistence.enabled=false -n monitoring
```
```
$ helm install thanos --values values.yaml --namespace monitoring bitnami/thanos --version 5.3.0
```

## Grafana Dashboard
Check your 'thanos-query' Service IP -> This is your Data Sources URL (PORT: 9090)
```
img
```

## Create-import-import via panel json (This file is 'grafana-dashboard-thanos.json', so copy and paste it)
![thanos](https://user-images.githubusercontent.com/70263403/182599017-20a48208-5d3c-4f25-95c2-f3307200ab5f.png)
