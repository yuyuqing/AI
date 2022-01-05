
//k8s tutorials begin
//-----------------------------------------------------------------------------------------------------------------------------

apt-get update
apt-get install -y apt-transport-https ca-certificates curl

cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb https://repo.huaweicloud.com/kubernetes/apt/ kubernetes-xenial main
EOF

curl -s https://repo.huaweicloud.com/kubernetes/apt/doc/apt-key.gpg | sudo apt-key add -

apt-get update
apt-get install kubeadm kubelet kubectl
apt-mark hold kubelet kubeadm kubectl

kubeadm config print init-defaults
kubeadm config images list
kubeadm config images list --kubernetes-version=v1.23.1 --image-repository registry.aliyuncs.com/google_containers

kubeadm init \
--image-repository registry.aliyuncs.com/google_containers \
--apiserver-advertise-address=192.168.222.103 \
--pod-network-cidr=10.16.0.0/16 \
--service-cidr=10.96.0.0/12 \
--kubernetes-version=v1.23.1

kubeadm init \
--apiserver-advertise-address=192.168.222.103 \
--pod-network-cidr=10.16.0.0/16 \
--service-cidr=10.96.0.0/12 \
--kubernetes-version=v1.23.1

mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config

export KUBECONFIG=/etc/kubernetes/admin.conf

kubectl create -f ./calico.yaml

curl -L --remote-name-all https://github.com/cilium/cilium-cli/releases/latest/download/cilium-linux-amd64.tar.gz{,.sha256sum}
sha256sum --check cilium-linux-amd64.tar.gz.sha256sum
sudo tar xzvfC cilium-linux-amd64.tar.gz /usr/local/bin
rm cilium-linux-amd64.tar.gz{,.sha256sum}

kubectl get nodes
kubectl get pods -A

kubectl taint nodes --all node-role.kubernetes.io/master-

kubeadm reset
systemctl stop kubelet
systemctl stop docker
rm -rf /var/lib/cni/
rm -rf /var/lib/kubelet/*
rm -rf /etc/cni
systemctl restart kubelet
systemctl restart docker

//-----------------------------------------------------------------------------------------------------------------------------
//k8s tutorials end



//helm tutorials begin
//-----------------------------------------------------------------------------------------------------------------------------

helm repo add stable https://charts.helm.sh/stable
helm repo add azure http://mirror.azure.cn/kubernetes/charts/
helm repo add cilium https://helm.cilium.io/
helm repo remove azure
helm repo list
helm repo update
helm search repo weave
helm install ui stable/weave-scope
helm status ui
helm list


helm install cilium cilium/cilium --version 1.11.0 --namespace kube-system

helm install cilium cilium/cilium --version 1.10.2 \
   --namespace kube-system \
   --set global.nodeinit.enabled=true \
   --set global.kubeProxyReplacement=partial \
   --set global.hostServices.enabled=false \
   --set global.externalIPs.enabled=true \
   --set global.nodePort.enabled=true \
   --set global.hostPort.enabled=true \
   --set global.pullPolicy=IfNotPresent \
   --set config.ipam=kubernetes \
   --set global.hubble.enabled=true \
   --set global.hubble.relay.enabled=true \
   --set global.hubble.ui.enabled=true \
   --set global.hubble.metrics.enabled="{dns,drop,tcp,flow,port-distribution,icmp,http}"

//-----------------------------------------------------------------------------------------------------------------------------
//helm tutorials end



//cilium tutorials begin
//-----------------------------------------------------------------------------------------------------------------------------
mount bpffs /sys/fs/bpf -t bpf

curl -LO https://raw.githubusercontent.com/cilium/cilium/v1.10/Documentation/gettingstarted/kind-config.yaml

//-----------------------------------------------------------------------------------------------------------------------------
//cilium tutorials end

