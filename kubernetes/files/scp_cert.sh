#!/bin/bash
sh /tmp/ssh_keygen.sh
scp /etc/kubernetes/pki/ca.crt root@k8s-master2:/etc/kubernetes/pki/
scp /etc/kubernetes/pki/ca.key root@k8s-master2:/etc/kubernetes/pki/
scp /etc/kubernetes/pki/sa.key root@k8s-master2:/etc/kubernetes/pki/
scp /etc/kubernetes/pki/sa.pub root@k8s-master2:/etc/kubernetes/pki/
scp /etc/kubernetes/pki/front-proxy-ca.crt root@k8s-master2:/etc/kubernetes/pki/
scp /etc/kubernetes/pki/front-proxy-ca.key root@k8s-master2:/etc/kubernetes/pki/
scp /etc/kubernetes/pki/etcd/ca.crt root@k8s-master2:/etc/kubernetes/pki/etcd/
scp /etc/kubernetes/pki/etcd/ca.key root@k8s-master2:/etc/kubernetes/pki/etcd/