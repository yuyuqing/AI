
//conda command tutorials begin
//-----------------------------------------------------------------------------------------------

conda config --set auto_activate_base false

conda env list
conda info --env

conda env remove d2l-zh
conda create -n -y d2l-zh python=3.8 pip
conda activate d2l-zh
conda update --all

pip install jupyter d2l torch torchvision


wget https://zh-v2.d2l.ai/d2l-zh.zip
unzip d2l-zh.zip
jupyter notebook

//-----------------------------------------------------------------------------------------------
//conda command tutorials end


//git command tutorials begin
//-----------------------------------------------------------------------------------------------

git config --global user.name "Your Name"
git config --global user.email "email@example.com"

mkdir xxx
cd xxx
git init

git add file_xxx
git commit -m "Wrote or Updated a file"

git status
git diff file_xxx

git log --pretty=oneline
git reset --hard HEAD^
git reset --hard xxxx
git reset --hadr HEAD~num
git reflog

git checkout -- file_xxx
git checkout -- *
git rm file_xxx

ssh-keygen -t  rsa -C "lvyijiu@icloud.com"

git remote add Origin-AI git@github.com:yuyuqing/AI.git
git push -u Origin-AI master
git push Origin-AI master
git remote -v
git remote rm Origin-AI

git clone git@github.com:yuyuqing/AI.git

//git branch -b (-b : create a branch and change to the branch)
git branch -b dev
git branch
git merge dev
git branch -d dev
git switch -c dev


//-----------------------------------------------------------------------------------------------
//git command tutorials end



//kvm command tutorials begin
//-----------------------------------------------------------------------------------------------
virt-install --virt-type=kvm --name=node1 --vcpus 4,cpuset=4-7 -r 4096 \
             --cputune vcpupin0.vcpu=0,vcpupin0.cpuset=4,vcpupin1.vcpu=1,vcpupin1.cpuset=5,vcpupin2.vcpu=2,vcpupin2.cpuset=6,vcpupin3.vcpu=3,vcpupin3.cpuset=7 \
             --disk path=/home/node1.qcow2,bus=virtio,size=40 \
             --network bridge=virbr0,model=virtio \
             --graphics vnc,listen=0.0.0.0 --noautoconsole --boot hd

virt-install --virt-type=kvm --name=node2 --vcpus 4,cpuset=8-11 -r 4096 \
             --cputune vcpupin0.vcpu=0,vcpupin0.cpuset=8,vcpupin1.vcpu=1,vcpupin1.cpuset=9,vcpupin2.vcpu=2,vcpupin2.cpuset=10,vcpupin3.vcpu=3,vcpupin3.cpuset=11 \
             --disk path=/home/node2.qcow2,bus=virtio,size=40 \
             --network bridge=virbr0,model=virtio \
             --graphics vnc,listen=0.0.0.0 --noautoconsole --boot hd

virt-install --virt-type=kvm --name=node3 --vcpus 4,cpuset=12-15 -r 4096 \
             --cputune vcpupin0.vcpu=0,vcpupin0.cpuset=12,vcpupin1.vcpu=1,vcpupin1.cpuset=13,vcpupin2.vcpu=2,vcpupin2.cpuset=14,vcpupin3.vcpu=3,vcpupin3.cpuset=15 \
             --disk path=/home/node3.qcow2,bus=virtio,size=40 \
             --network bridge=virbr0,model=virtio \
             --graphics vnc,listen=0.0.0.0 --noautoconsole --boot hd

//===============================================================================================
virt-install --virt-type=kvm --name=node1 --vcpus 4,cpuset=4-7 -r 4096 \
             --cputune vcpupin0.vcpu=0,vcpupin0.cpuset=4,vcpupin1.vcpu=1,vcpupin1.cpuset=5,vcpupin2.vcpu=2,vcpupin2.cpuset=6,vcpupin3.vcpu=3,vcpupin3.cpuset=7 \
			 --numa node,nodeid=0,cpus=0-1,mem=2048 --numa node,nodeid=1,cpus=2-3,mem=2048 \
             --disk path=/home/node1.qcow2,bus=virtio,size=40 \
             --network bridge=virbr0,model=virtio \
             --graphics vnc,listen=0.0.0.0 --noautoconsole --boot hd
//===============================================================================================

ovs-vsctl add-br c-br
ovs-vsctl add-br d-br

ifconfig c-br 172.100.20.1/24
ifconfig d-br 172.100.30.1/24

ifconfig c-br up
ifconfig d-br up

virsh net-define virsh-c-net.xml
virsh net-define virsh-d-net.xml
virsh net-start m-net
virsh net-start m-net


virt-install --virt-type=kvm --name=node1 --vcpus 4,cpuset=4-7 -r 4096 \
             --cputune vcpupin0.vcpu=0,vcpupin0.cpuset=4,vcpupin1.vcpu=1,vcpupin1.cpuset=5,vcpupin2.vcpu=2,vcpupin2.cpuset=6,vcpupin3.vcpu=3,vcpupin3.cpuset=7 \
             --disk path=/home/node1.qcow2,bus=virtio,size=40 \
             --network bridge=virbr0,model=virtio --network network=c-net,model=virtio --network network=d-net,model=virtio \
             --graphics vnc,listen=0.0.0.0 --noautoconsole --boot hd

virt-install --virt-type=kvm --name=node2 --vcpus 4,cpuset=8-11 -r 4096 \
             --cputune vcpupin0.vcpu=0,vcpupin0.cpuset=8,vcpupin1.vcpu=1,vcpupin1.cpuset=9,vcpupin2.vcpu=2,vcpupin2.cpuset=10,vcpupin3.vcpu=3,vcpupin3.cpuset=11 \
             --disk path=/home/node2.qcow2,bus=virtio,size=40 \
             --network bridge=virbr0,model=virtio --network network=c-net,model=virtio --network network=d-net,model=virtio \
             --graphics vnc,listen=0.0.0.0 --noautoconsole --boot hd

virt-install --virt-type=kvm --name=node3 --vcpus 4,cpuset=12-15 -r 4096 \
             --cputune vcpupin0.vcpu=0,vcpupin0.cpuset=12,vcpupin1.vcpu=1,vcpupin1.cpuset=13,vcpupin2.vcpu=2,vcpupin2.cpuset=14,vcpupin3.vcpu=3,vcpupin3.cpuset=15 \
             --disk path=/home/node3.qcow2,bus=virtio,size=40 \
             --network bridge=virbr0,model=virtio --network network=c-net,model=virtio --network network=d-net,model=virtio \
             --graphics vnc,listen=0.0.0.0 --noautoconsole --boot hd

gvncviewer ubuntu:0

//===============================================================================================


//-----------------------------------------------------------------------------------------------
//kvm command tutorials end



//docker command tutorials begin
//-----------------------------------------------------------------------------------------------

docker run --name=mynginx -d --restart=always -p 88:80 nginx:1.21.4
docker stop  mynginx
docker start mynginx
docker rm -f mynginx
docker update mynginx --restart=always
docker exec -it mynginx /bin/bash
docker logs mynginx
docker cp mynginx:/etc/nginx/nginx.conf /home/wrk3/k8s/data/nginx/nginx.conf
docker cp /home/wrk3/k8s/data/nginx/nginx.conf mynginx:/etc/nginx/nginx.conf

docker commit -a "yuyuqing" -m "modify head page" mynginx nginx_yu:1.21.4
docker save -o test_nginx.tar nginx:1.21.4
docker load -i test_nginx.tar

docker login
docker logout

docker run --name=mynginx -d --restart=always -p 88:80 -v /home/wrk3/k8s/data/html:/usr/share/nginx/html:rw nginx:1.21.4

//-----------------------------------------------------------------------------------------------
//docker command tutotials end
