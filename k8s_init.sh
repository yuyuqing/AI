
apt-get update
apt-get install -y apt-transport-https ca-certificates curl

cat <<EOF > /etc/apt/sources.list.d/kubernetes.list
deb https://repo.huaweicloud.com/kubernetes/apt/ kubernetes-xenial main
EOF

curl -s https://repo.huaweicloud.com/kubernetes/apt/doc/apt-key.gpg | sudo apt-key add -

apt-get update
apt-get install kubeadm kubelet kubectl
apt-mark hold kubelet kubeadm kubectl

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

curl -L --remote-name-all https://github.com/cilium/cilium-cli/releases/latest/download/cilium-linux-amd64.tar.gz{,.sha256sum}
sha256sum --check cilium-linux-amd64.tar.gz.sha256sum
sudo tar xzvfC cilium-linux-amd64.tar.gz /usr/local/bin
rm cilium-linux-amd64.tar.gz{,.sha256sum}

kubectl get nodes
kubectl get pods -A

kubectl taint nodes --all node-role.kubernetes.io/master-


//helm tutorials begin
//-----------------------------------------------------------------------------------------------------------------------------

helm repo add stable https://charts.helm.sh/stable
helm repo add azure http://mirror.azure.cn/kubernetes/charts/
helm repo remove azure
helm repo list
helm repo update

//-----------------------------------------------------------------------------------------------------------------------------
//helm tutorials end



//cilium tutorials begin
//-----------------------------------------------------------------------------------------------------------------------------
mount bpffs /sys/fs/bpf -t bpf

curl -LO https://raw.githubusercontent.com/cilium/cilium/v1.10/Documentation/gettingstarted/kind-config.yaml

//-----------------------------------------------------------------------------------------------------------------------------
//cilium tutorials end

