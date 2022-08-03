git clone https://github.com/benc-uk/kubeview.git

cd charts
helm install kubeview ./kubeview -f myvalues.yaml
