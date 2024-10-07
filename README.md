只需要修改kubernetes/hosts.ini和kubernetes/var/main.yaml文件，其余均是自动完成的

`ansible-playbook site.yaml -i kubernetes/hosts.ini`运行

目录结构

```shell
[root@ansible-1 k8s_test]# tree
.
├── kubernetes
│   ├── files
│   │   ├── check-haproxy.sh
│   │   ├── cri-dockerd-0.3.4.amd64.tgz
│   │   ├── cri-docker.service
│   │   ├── cri-docker.socket
│   │   ├── daemon.json
│   │   ├── docker-ce.repo
│   │   ├── kube-flannel.yml
│   │   ├── kubernetes.repo
│   │   ├── scp_cert.sh
│   │   └── test
│   ├── handlers
│   │   └── main.yaml
│   ├── hosts.ini
│   ├── tasks
│   │   ├── a_env.yaml
│   │   ├── b_docker_install.yaml
│   │   ├── c_cri_docker.yaml
│   │   ├── d_kube_install.yaml
│   │   ├── e_ssh_conect.yaml
│   │   ├── f_ha_keep_lvs_masters.yaml
│   │   ├── g_kubeadm.yaml
│   │   ├── main.yaml
│   │   └── test.yaml
│   ├── templates
│   │   ├── etcd.yaml.j2
│   │   ├── haproxy.cfg.j2
│   │   ├── hosts.j2
│   │   ├── keepalived.conf.j2
│   │   ├── ssh_keygen.sh.j2
│   │   └── test.j2
│   └── vars
│       └── main.yaml
└── site.yaml
```





