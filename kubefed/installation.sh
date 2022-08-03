#! /bin/bash

# KubeFed Installation Script
# Prerequisities
#   - Run on master node
#   - At least 1 worker node attached to master
#   - Check master node's hostname  

### Make sure only root can run our script
if (( $EUID != 0 )); then
	echo "This script must be run as root"
	echo $EUID
	exit
fi

while :
do
    # Check helm is installed
    helm version | grep version

    if [ $? -eq 0 ]; then
        break
    else
        # Install helm3
        curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
        chmod 700 get_helm.sh
        ./get_helm.sh
    fi
done

# If you want to install another KubeFed version, Change this value

# Repo add and create namespace
helm repo add kubefed-charts https://raw.githubusercontent.com/kubernetes-sigs/kubefed/master/charts
KUBEFED_VERSION=$(helm search repo kubefed | grep kubefed-charts | awk -- '{printf $2}')
helm --namespace kube-federation-system upgrade -i kubefed kubefed-charts/kubefed --version=${KUBEFED_VERSION} --create-namespace

OS=linux
ARCH=amd64

# Install kubefedctl
curl -LO https://github.com/kubernetes-sigs/kubefed/releases/download/v${KUBEFED_VERSION}/kubefedctl-${KUBEFED_VERSION}-${OS}-${ARCH}.tgz
tar -zxvf kubefedctl-*.tgz
chmod u+x kubefedctl
sudo mv kubefedctl /usr/local/bin/

echo -e '\n'
echo -e '\n'
echo -e '*******************Change your own config file*******************\n\n\n\n\n'

cat /root/.kube/config

# After change your own config
# ex) cluster1(host), cluster2(member)
#   $ systemctl daemon-reload
#   $ systemctl restart kubelet
#   $ kubectl config get-contexts

#   $ kubefedctl join cluster1 --cluster-context cluster1 --host-cluster-context cluster1 --kubefed-namespace=kube-federation-system --v=2 (host)
#   $ kubefedctl join cluster2 --cluster-context cluster2 --host-cluster-context cluster1 --kubefed-namespace=kube-federation-system --v=2 (member)
#   $ kubectl -n kube-federation-system get kubefedclusters

# Test
#   $ kubectl create ns federate-me
#   $ kubefedctl federate ns federate-me
#   $ kubectl -n federate-me create cm my-cm
#   $ kubefedctl -n federate-me federate configmap my-cm
#   $ kubectl -n federate-me describe federatedconfigmap my-cm
#   $ kubectl describe ns federate-me (check each clusters)
