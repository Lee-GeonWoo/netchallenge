# Thanos
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
$ kubectl create ns monitoring
```
```
$ helm install kube-prometheus bitnami/kube-prometheus --set prometheus.thanos.create=true --set operator.service.type=ClusterIP --set prometheus.service.type=ClusterIP --set alertmanager.service.type=ClusterIP --set prometheus.thanos.service.type=LoadBalancer -n monitoring
```
```
$ helm install grafana bitnami/grafana --set service.type=NodePort --set admin.password=ckddmlrhks401! --set persistence.enabled=false -n monitoring
```
```
$ helm install thanos --values values.yaml --namespace monitoring bitnami/thanos --version 5.3.0
```

## Grafana Dashboard
Check your 'thanos-query' Service IP -> This is your Data Sources URL (PORT: 9090)  
![grafana](https://user-images.githubusercontent.com/70263403/182618940-5c0dcc30-4173-4f33-ad9e-5532abd008cb.png)

Create-import-import via panel json (This file is 'grafana-dashboard-thanos.json', so copy and paste it)  
![thanos](https://user-images.githubusercontent.com/70263403/182619185-64b15055-1bbd-46f7-8ca3-ad0d20a1f1fc.png)

