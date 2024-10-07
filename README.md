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
```
[root@ansible-1 k8s_test]# ansible-playbook site.yaml -i kubernetes/hosts.ini 
[WARNING]: Invalid characters were found in group names but not replaced, use -vvvv to see details

PLAY [k8s] **********************************************************************************************************************************************************************************
TASK [Gathering Facts] **********************************************************************************************************************************************************************ok: [k8s-node2]
ok: [k8s-master1]
ok: [k8s-master2]
ok: [k8s-master3]
ok: [k8s-node1]
ok: [k8s-node3]

TASK [kubernetes : include_tasks] ***********************************************************************************************************************************************************included: /yumrepo/repo/ansible_repo/roles/k8s_test/kubernetes/tasks/a_env.yaml for k8s-master1, k8s-master2, k8s-master3, k8s-node1, k8s-node2, k8s-node3

TASK [kubernetes : 收集信息] ********************************************************************************************************************************************************************
ok: [k8s-master2]
ok: [k8s-node1]
ok: [k8s-node2]
ok: [k8s-master1]
ok: [k8s-master3]
ok: [k8s-node3]

TASK [kubernetes : 安装实用工具] ******************************************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-master2]
changed: [k8s-node2]
changed: [k8s-master3]
changed: [k8s-node1]
changed: [k8s-node3]

TASK [kubernetes : service] *****************************************************************************************************************************************************************ok: [k8s-node2]
ok: [k8s-master1]
ok: [k8s-node1]
ok: [k8s-master3]
ok: [k8s-master2]
ok: [k8s-node3]

TASK [kubernetes : lineinfile] **************************************************************************************************************************************************************ok: [k8s-node1]
ok: [k8s-master3]
ok: [k8s-master2]
ok: [k8s-master1]
ok: [k8s-node2]
ok: [k8s-node3]

TASK [kubernetes : command] *****************************************************************************************************************************************************************fatal: [k8s-node2]: FAILED! => {"changed": true, "cmd": ["setenforce", "0"], "delta": "0:00:00.005568", "end": "2024-10-07 19:26:05.592437", "msg": "non-zero return code", "rc": 1, "start": "2024-10-07 19:26:05.586869", "stderr": "setenforce: SELinux is disabled", "stderr_lines": ["setenforce: SELinux is disabled"], "stdout": "", "stdout_lines": []}
...ignoring
fatal: [k8s-master1]: FAILED! => {"changed": true, "cmd": ["setenforce", "0"], "delta": "0:00:00.005089", "end": "2024-10-07 19:26:05.568755", "msg": "non-zero return code", "rc": 1, "start": "2024-10-07 19:26:05.563666", "stderr": "setenforce: SELinux is disabled", "stderr_lines": ["setenforce: SELinux is disabled"], "stdout": "", "stdout_lines": []}
...ignoring
fatal: [k8s-node1]: FAILED! => {"changed": true, "cmd": ["setenforce", "0"], "delta": "0:00:00.006542", "end": "2024-10-07 19:26:05.584174", "msg": "non-zero return code", "rc": 1, "start": "2024-10-07 19:26:05.577632", "stderr": "setenforce: SELinux is disabled", "stderr_lines": ["setenforce: SELinux is disabled"], "stdout": "", "stdout_lines": []}
...ignoring
fatal: [k8s-master2]: FAILED! => {"changed": true, "cmd": ["setenforce", "0"], "delta": "0:00:00.005814", "end": "2024-10-07 19:26:05.589109", "msg": "non-zero return code", "rc": 1, "start": "2024-10-07 19:26:05.583295", "stderr": "setenforce: SELinux is disabled", "stderr_lines": ["setenforce: SELinux is disabled"], "stdout": "", "stdout_lines": []}
...ignoring
fatal: [k8s-master3]: FAILED! => {"changed": true, "cmd": ["setenforce", "0"], "delta": "0:00:00.006200", "end": "2024-10-07 19:26:05.615350", "msg": "non-zero return code", "rc": 1, "start": "2024-10-07 19:26:05.609150", "stderr": "setenforce: SELinux is disabled", "stderr_lines": ["setenforce: SELinux is disabled"], "stdout": "", "stdout_lines": []}
...ignoring
fatal: [k8s-node3]: FAILED! => {"changed": true, "cmd": ["setenforce", "0"], "delta": "0:00:00.005911", "end": "2024-10-07 19:26:05.884603", "msg": "non-zero return code", "rc": 1, "start": "2024-10-07 19:26:05.878692", "stderr": "setenforce: SELinux is disabled", "stderr_lines": ["setenforce: SELinux is disabled"], "stdout": "", "stdout_lines": []}
...ignoring

TASK [kubernetes : 停止并禁用交换] *****************************************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-master3]
changed: [k8s-master2]
changed: [k8s-node1]
changed: [k8s-node2]
changed: [k8s-node3]

TASK [kubernetes : 编辑 /etc/hosts] ***********************************************************************************************************************************************************
changed: [k8s-master3]
changed: [k8s-node1]
changed: [k8s-master1]
changed: [k8s-master2]
changed: [k8s-node2]
changed: [k8s-node3]

TASK [kubernetes : 设置主机名] *******************************************************************************************************************************************************************
changed: [k8s-master2]
changed: [k8s-node2]
changed: [k8s-master1]
changed: [k8s-node1]
changed: [k8s-master3]
changed: [k8s-node3]

TASK [kubernetes : 同步时间] ********************************************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-master2]
changed: [k8s-master3]
changed: [k8s-node1]
changed: [k8s-node2]
changed: [k8s-node3]

TASK [kubernetes : 创建 ipvs.modules] *********************************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-master2]
changed: [k8s-node2]
changed: [k8s-master3]
changed: [k8s-node1]
changed: [k8s-node3]

TASK [kubernetes : 执行 ipvs.modules] *********************************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-master3]
changed: [k8s-node1]
changed: [k8s-node2]
changed: [k8s-master2]
changed: [k8s-node3]

TASK [kubernetes : 创建 k8s.conf 以加载模块] *******************************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-master3]
changed: [k8s-master2]
changed: [k8s-node2]
changed: [k8s-node1]
changed: [k8s-node3]

TASK [kubernetes : 加载 overlay 和 br_netfilter 模块] ********************************************************************************************************************************************
changed: [k8s-node1] => (item=overlay)
changed: [k8s-master1] => (item=overlay)
changed: [k8s-master2] => (item=overlay)
changed: [k8s-master3] => (item=overlay)
changed: [k8s-node2] => (item=overlay)
changed: [k8s-master1] => (item=br_netfilter)
changed: [k8s-master2] => (item=br_netfilter)
changed: [k8s-master3] => (item=br_netfilter)
changed: [k8s-node1] => (item=br_netfilter)
changed: [k8s-node2] => (item=br_netfilter)
changed: [k8s-node3] => (item=overlay)
changed: [k8s-node3] => (item=br_netfilter)

TASK [kubernetes : 创建 k8s.conf 以配置 sysctl 设置] ***********************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-master2]
changed: [k8s-node1]
changed: [k8s-master3]
changed: [k8s-node2]
changed: [k8s-node3]

TASK [kubernetes : 应用 sysctl 设置] ************************************************************************************************************************************************************
changed: [k8s-master2]
changed: [k8s-master1]
changed: [k8s-master3]
changed: [k8s-node2]
changed: [k8s-node1]
changed: [k8s-node3]

TASK [kubernetes : include_tasks] ***********************************************************************************************************************************************************included: /yumrepo/repo/ansible_repo/roles/k8s_test/kubernetes/tasks/b_docker_install.yaml for k8s-master1, k8s-master2, k8s-master3, k8s-node1, k8s-node2, k8s-node3

TASK [kubernetes : 配置 Docker 的 yum 源] *******************************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-node1]
changed: [k8s-node2]
changed: [k8s-master2]
changed: [k8s-master3]
changed: [k8s-node3]

TASK [kubernetes : 安装 Docker] ***************************************************************************************************************************************************************

changed: [k8s-node1]
changed: [k8s-node2]
changed: [k8s-master1]
changed: [k8s-master2]
changed: [k8s-master3]
changed: [k8s-node3]

TASK [kubernetes : 创建 Docker 配置目录] **********************************************************************************************************************************************************
ok: [k8s-master2]
ok: [k8s-master3]
ok: [k8s-node1]
ok: [k8s-node2]
ok: [k8s-master1]
ok: [k8s-node3]

TASK [kubernetes : 编辑 daemon.json] **********************************************************************************************************************************************************
changed: [k8s-master2]
changed: [k8s-node2]
changed: [k8s-node1]
changed: [k8s-master3]
changed: [k8s-master1]
changed: [k8s-node3]

TASK [kubernetes : 启动并启用 Docker 服务] *********************************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-master2]
changed: [k8s-node1]
changed: [k8s-node2]
changed: [k8s-master3]
changed: [k8s-node3]

TASK [kubernetes : include_tasks] ***********************************************************************************************************************************************************included: /yumrepo/repo/ansible_repo/roles/k8s_test/kubernetes/tasks/c_cri_docker.yaml for k8s-master1, k8s-master2, k8s-master3, k8s-node1, k8s-node2, k8s-node3

TASK [kubernetes : 发送 cri-docker 包] *********************************************************************************************************************************************************
changed: [k8s-node2]
changed: [k8s-master3]
changed: [k8s-master1]
changed: [k8s-node1]
changed: [k8s-master2]
changed: [k8s-node3]

TASK [kubernetes : 解压 cri-docker 包] *********************************************************************************************************************************************************
[WARNING]: Consider using the unarchive module rather than running 'tar'.  If you need to use command because unarchive is insufficient you can add 'warn: false' to this command task or
set 'command_warnings=False' in ansible.cfg to get rid of this message.
changed: [k8s-master2]
changed: [k8s-master1]
changed: [k8s-node1]
changed: [k8s-master3]
changed: [k8s-node2]
changed: [k8s-node3]

TASK [kubernetes : 复制 cri-docker 文件] ********************************************************************************************************************************************************
changed: [k8s-node1]
changed: [k8s-master1]
changed: [k8s-master2]
changed: [k8s-master3]
changed: [k8s-node2]
changed: [k8s-node3]

TASK [kubernetes : 复制 cri-docker 服务文件] ******************************************************************************************************************************************************
changed: [k8s-master2]
changed: [k8s-master1]
changed: [k8s-node2]
changed: [k8s-node1]
changed: [k8s-master3]
changed: [k8s-node3]

TASK [kubernetes : 复制 cri-docker 套接字文件] *****************************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-master2]
changed: [k8s-node1]
changed: [k8s-node2]
changed: [k8s-master3]
changed: [k8s-node3]

TASK [kubernetes : 重新加载系统守护进程] **************************************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-master2]
changed: [k8s-node1]
changed: [k8s-master3]
changed: [k8s-node2]
changed: [k8s-node3]

TASK [kubernetes : 启动 cri-docker 服务] ********************************************************************************************************************************************************
changed: [k8s-node1]
changed: [k8s-master1]
changed: [k8s-master3]
changed: [k8s-master2]
changed: [k8s-node2]
changed: [k8s-node3]

TASK [kubernetes : include_tasks] ***********************************************************************************************************************************************************included: /yumrepo/repo/ansible_repo/roles/k8s_test/kubernetes/tasks/d_kube_install.yaml for k8s-master1, k8s-master2, k8s-master3, k8s-node1, k8s-node2, k8s-node3

TASK [kubernetes : 配置 Kubernetes yum 源] *****************************************************************************************************************************************************
changed: [k8s-node2]
changed: [k8s-master3]
changed: [k8s-master1]
changed: [k8s-master2]
changed: [k8s-node1]
changed: [k8s-node3]

TASK [kubernetes : 安装 kubeadm、kubelet 和 kubectl] ********************************************************************************************************************************************
changed: [k8s-node2]
changed: [k8s-master3]
changed: [k8s-node1]
changed: [k8s-master1]
changed: [k8s-master2]
changed: [k8s-node3]

TASK [kubernetes : 启动并启用 kubelet 服务] ********************************************************************************************************************************************************
changed: [k8s-master3]
changed: [k8s-master1]
changed: [k8s-node1]
changed: [k8s-master2]
changed: [k8s-node2]
changed: [k8s-node3]

TASK [kubernetes : include_tasks] ***********************************************************************************************************************************************************included: /yumrepo/repo/ansible_repo/roles/k8s_test/kubernetes/tasks/e_ssh_conect.yaml for k8s-master1, k8s-master2, k8s-master3, k8s-node1, k8s-node2, k8s-node3

TASK [kubernetes : 复制 ssh_keygen.sh 到目标机器] **************************************************************************************************************************************************
changed: [k8s-master3]
changed: [k8s-node1]
changed: [k8s-master1]
changed: [k8s-node2]
changed: [k8s-master2]
changed: [k8s-node3]

TASK [kubernetes : 执行 SSH 密钥生成脚本] ***********************************************************************************************************************************************************
ok: [k8s-master1]
ok: [k8s-master2]
ok: [k8s-master3]
ok: [k8s-node1]
ok: [k8s-node2]
ok: [k8s-node3]

TASK [kubernetes : 显示执行结果] ******************************************************************************************************************************************************************
ok: [k8s-master1] => {
    "result.stdout": "skipped, since /root/.ssh/id_rsa does not exist"
}
ok: [k8s-master2] => {
    "result.stdout": "skipped, since /root/.ssh/id_rsa does not exist"
}
ok: [k8s-master3] => {
    "result.stdout": "skipped, since /root/.ssh/id_rsa does not exist"
}
ok: [k8s-node3] => {
    "result.stdout": "skipped, since /root/.ssh/id_rsa does not exist"
}
ok: [k8s-node1] => {
    "result.stdout": "skipped, since /root/.ssh/id_rsa does not exist"
}
ok: [k8s-node2] => {
    "result.stdout": "skipped, since /root/.ssh/id_rsa does not exist"
}

TASK [kubernetes : include_tasks] ***********************************************************************************************************************************************************skipping: [k8s-node2]
skipping: [k8s-node1]
skipping: [k8s-node3]
included: /yumrepo/repo/ansible_repo/roles/k8s_test/kubernetes/tasks/f_ha_keep_lvs_masters.yaml for k8s-master1, k8s-master2, k8s-master3

TASK [kubernetes : 安装 HAProxy 和 Keepalived] *************************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-master2]
changed: [k8s-master3]

TASK [kubernetes : 从模板生成 haproxy.cfg] *******************************************************************************************************************************************************
changed: [k8s-master2]
changed: [k8s-master1]
changed: [k8s-master3]

TASK [kubernetes : 从模板生成 keepalived.conf] ***************************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-master3]
changed: [k8s-master2]

TASK [kubernetes : 复制 check-haproxy.sh 到目标机器] ***********************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-master2]
changed: [k8s-master3]

TASK [kubernetes : 启动并启用 HAProxy 服务] ********************************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-master2]
changed: [k8s-master3]

TASK [kubernetes : 启动并启用 Keepalived 服务] *****************************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-master3]
changed: [k8s-master2]

TASK [kubernetes : include_tasks] ***********************************************************************************************************************************************************included: /yumrepo/repo/ansible_repo/roles/k8s_test/kubernetes/tasks/g_kubeadm.yaml for k8s-master1, k8s-master2, k8s-master3, k8s-node1, k8s-node2, k8s-node3

TASK [kubernetes : 重置 kubeadm] **************************************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-node1]
changed: [k8s-master3]
changed: [k8s-master2]
changed: [k8s-node2]
changed: [k8s-node3]

TASK [kubernetes : 初始化 kubeadm] *************************************************************************************************************************************************************
skipping: [k8s-master2]
skipping: [k8s-master3]
skipping: [k8s-node1]
skipping: [k8s-node2]
skipping: [k8s-node3]
changed: [k8s-master1]

TASK [kubernetes : 初始化后配置 kube 目录] **********************************************************************************************************************************************************
skipping: [k8s-master3]
skipping: [k8s-master2]
skipping: [k8s-node1]
skipping: [k8s-node2]
skipping: [k8s-node3]
[WARNING]: Consider using the file module with state=directory rather than running 'mkdir'.  If you need to use command because file is insufficient you can add 'warn: false' to this
command task or set 'command_warnings=False' in ansible.cfg to get rid of this message.
changed: [k8s-master1]

TASK [kubernetes : 复制 admin.conf 到 kube 目录] *************************************************************************************************************************************************
skipping: [k8s-master2]
skipping: [k8s-master3]
skipping: [k8s-node1]
skipping: [k8s-node2]
skipping: [k8s-node3]
changed: [k8s-master1]

TASK [kubernetes : 创建 etcd 目录] **************************************************************************************************************************************************************
skipping: [k8s-master1]
skipping: [k8s-node1]
skipping: [k8s-node2]
skipping: [k8s-node3]
changed: [k8s-master3]
changed: [k8s-master2]

TASK [kubernetes : 复制 Kubernetes PKI 文件到 k8s-master] ****************************************************************************************************************************************
skipping: [k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/ca.crt', u'src': u'/etc/kubernetes/pki/ca.crt'}) 
skipping: [k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/ca.key', u'src': u'/etc/kubernetes/pki/ca.key'}) 
skipping: [k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/sa.key', u'src': u'/etc/kubernetes/pki/sa.key'}) 
skipping: [k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/sa.pub', u'src': u'/etc/kubernetes/pki/sa.pub'}) 
skipping: [k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/front-proxy-ca.crt', u'src': u'/etc/kubernetes/pki/front-proxy-ca.crt'}) 
skipping: [k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/front-proxy-ca.key', u'src': u'/etc/kubernetes/pki/front-proxy-ca.key'}) 
skipping: [k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/etcd/ca.crt', u'src': u'/etc/kubernetes/pki/etcd/ca.crt'}) 
skipping: [k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/etcd/ca.key', u'src': u'/etc/kubernetes/pki/etcd/ca.key'}) 
skipping: [k8s-node1] => (item={u'dest': u'/etc/kubernetes/pki/ca.crt', u'src': u'/etc/kubernetes/pki/ca.crt'}) 
skipping: [k8s-node1] => (item={u'dest': u'/etc/kubernetes/pki/ca.key', u'src': u'/etc/kubernetes/pki/ca.key'}) 
skipping: [k8s-node1] => (item={u'dest': u'/etc/kubernetes/pki/sa.key', u'src': u'/etc/kubernetes/pki/sa.key'}) 
skipping: [k8s-node1] => (item={u'dest': u'/etc/kubernetes/pki/sa.pub', u'src': u'/etc/kubernetes/pki/sa.pub'}) 
skipping: [k8s-node1] => (item={u'dest': u'/etc/kubernetes/pki/front-proxy-ca.crt', u'src': u'/etc/kubernetes/pki/front-proxy-ca.crt'}) 
skipping: [k8s-node1] => (item={u'dest': u'/etc/kubernetes/pki/front-proxy-ca.key', u'src': u'/etc/kubernetes/pki/front-proxy-ca.key'}) 
skipping: [k8s-node1] => (item={u'dest': u'/etc/kubernetes/pki/etcd/ca.crt', u'src': u'/etc/kubernetes/pki/etcd/ca.crt'}) 
skipping: [k8s-node1] => (item={u'dest': u'/etc/kubernetes/pki/etcd/ca.key', u'src': u'/etc/kubernetes/pki/etcd/ca.key'}) 
skipping: [k8s-node2] => (item={u'dest': u'/etc/kubernetes/pki/ca.crt', u'src': u'/etc/kubernetes/pki/ca.crt'}) 
skipping: [k8s-node2] => (item={u'dest': u'/etc/kubernetes/pki/ca.key', u'src': u'/etc/kubernetes/pki/ca.key'}) 
skipping: [k8s-node2] => (item={u'dest': u'/etc/kubernetes/pki/sa.key', u'src': u'/etc/kubernetes/pki/sa.key'}) 
skipping: [k8s-node2] => (item={u'dest': u'/etc/kubernetes/pki/sa.pub', u'src': u'/etc/kubernetes/pki/sa.pub'}) 
skipping: [k8s-node2] => (item={u'dest': u'/etc/kubernetes/pki/front-proxy-ca.crt', u'src': u'/etc/kubernetes/pki/front-proxy-ca.crt'}) 
skipping: [k8s-node3] => (item={u'dest': u'/etc/kubernetes/pki/ca.crt', u'src': u'/etc/kubernetes/pki/ca.crt'}) 
skipping: [k8s-node3] => (item={u'dest': u'/etc/kubernetes/pki/ca.key', u'src': u'/etc/kubernetes/pki/ca.key'}) 
skipping: [k8s-node3] => (item={u'dest': u'/etc/kubernetes/pki/sa.key', u'src': u'/etc/kubernetes/pki/sa.key'}) 
skipping: [k8s-node2] => (item={u'dest': u'/etc/kubernetes/pki/front-proxy-ca.key', u'src': u'/etc/kubernetes/pki/front-proxy-ca.key'}) 
skipping: [k8s-node2] => (item={u'dest': u'/etc/kubernetes/pki/etcd/ca.crt', u'src': u'/etc/kubernetes/pki/etcd/ca.crt'}) 
skipping: [k8s-node2] => (item={u'dest': u'/etc/kubernetes/pki/etcd/ca.key', u'src': u'/etc/kubernetes/pki/etcd/ca.key'}) 
skipping: [k8s-node3] => (item={u'dest': u'/etc/kubernetes/pki/sa.pub', u'src': u'/etc/kubernetes/pki/sa.pub'}) 
skipping: [k8s-node3] => (item={u'dest': u'/etc/kubernetes/pki/front-proxy-ca.crt', u'src': u'/etc/kubernetes/pki/front-proxy-ca.crt'}) 
skipping: [k8s-node3] => (item={u'dest': u'/etc/kubernetes/pki/front-proxy-ca.key', u'src': u'/etc/kubernetes/pki/front-proxy-ca.key'}) 
skipping: [k8s-node3] => (item={u'dest': u'/etc/kubernetes/pki/etcd/ca.crt', u'src': u'/etc/kubernetes/pki/etcd/ca.crt'}) 
skipping: [k8s-node3] => (item={u'dest': u'/etc/kubernetes/pki/etcd/ca.key', u'src': u'/etc/kubernetes/pki/etcd/ca.key'}) 
changed: [k8s-master2 -> k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/ca.crt', u'src': u'/etc/kubernetes/pki/ca.crt'})
changed: [k8s-master3 -> k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/ca.crt', u'src': u'/etc/kubernetes/pki/ca.crt'})
changed: [k8s-master2 -> k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/ca.key', u'src': u'/etc/kubernetes/pki/ca.key'})
changed: [k8s-master3 -> k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/ca.key', u'src': u'/etc/kubernetes/pki/ca.key'})
changed: [k8s-master3 -> k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/sa.key', u'src': u'/etc/kubernetes/pki/sa.key'})
changed: [k8s-master2 -> k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/sa.key', u'src': u'/etc/kubernetes/pki/sa.key'})
changed: [k8s-master2 -> k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/sa.pub', u'src': u'/etc/kubernetes/pki/sa.pub'})
changed: [k8s-master3 -> k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/sa.pub', u'src': u'/etc/kubernetes/pki/sa.pub'})
changed: [k8s-master3 -> k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/front-proxy-ca.crt', u'src': u'/etc/kubernetes/pki/front-proxy-ca.crt'})
changed: [k8s-master2 -> k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/front-proxy-ca.crt', u'src': u'/etc/kubernetes/pki/front-proxy-ca.crt'})
changed: [k8s-master3 -> k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/front-proxy-ca.key', u'src': u'/etc/kubernetes/pki/front-proxy-ca.key'})
changed: [k8s-master2 -> k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/front-proxy-ca.key', u'src': u'/etc/kubernetes/pki/front-proxy-ca.key'})
changed: [k8s-master3 -> k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/etcd/ca.crt', u'src': u'/etc/kubernetes/pki/etcd/ca.crt'})
changed: [k8s-master2 -> k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/etcd/ca.crt', u'src': u'/etc/kubernetes/pki/etcd/ca.crt'})
changed: [k8s-master3 -> k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/etcd/ca.key', u'src': u'/etc/kubernetes/pki/etcd/ca.key'})
changed: [k8s-master2 -> k8s-master1] => (item={u'dest': u'/etc/kubernetes/pki/etcd/ca.key', u'src': u'/etc/kubernetes/pki/etcd/ca.key'})

TASK [kubernetes : 从 master1 获取加入命令] ********************************************************************************************************************************************************
skipping: [k8s-master2]
skipping: [k8s-master3]
skipping: [k8s-node1]
skipping: [k8s-node2]
skipping: [k8s-node3]
changed: [k8s-master1]

TASK [kubernetes : 分发初始化命令] *****************************************************************************************************************************************************************
skipping: [k8s-master1]
changed: [k8s-master2 -> k8s-master1]
changed: [k8s-master3 -> k8s-master1]
changed: [k8s-node2 -> k8s-master1]
changed: [k8s-node1 -> k8s-master1]
changed: [k8s-node3 -> k8s-master1]

TASK [kubernetes : 主节点加入 Kubernetes 集群] *****************************************************************************************************************************************************
skipping: [k8s-master1]
skipping: [k8s-node2]
skipping: [k8s-node1]
skipping: [k8s-node3]
[WARNING]: Consider using the replace, lineinfile or template module rather than running 'sed'.  If you need to use command because replace, lineinfile or template is insufficient you can
add 'warn: false' to this command task or set 'command_warnings=False' in ansible.cfg to get rid of this message.
changed: [k8s-master2]
changed: [k8s-master3]

TASK [kubernetes : 工作节点加入 Kubernetes 集群] ****************************************************************************************************************************************************
skipping: [k8s-master1]
skipping: [k8s-master3]
skipping: [k8s-master2]
changed: [k8s-node1]
changed: [k8s-node2]
changed: [k8s-node3]

TASK [kubernetes : 复制 Flannel 配置文件] *********************************************************************************************************************************************************
skipping: [k8s-master3]
skipping: [k8s-master2]
skipping: [k8s-node2]
skipping: [k8s-node1]
skipping: [k8s-node3]
changed: [k8s-master1]

TASK [kubernetes : 创建 Flannel 网络] ***********************************************************************************************************************************************************
skipping: [k8s-master2]
skipping: [k8s-master3]
skipping: [k8s-node1]
skipping: [k8s-node2]
skipping: [k8s-node3]
changed: [k8s-master1]

TASK [kubernetes : 配置 etcd 高可用性] ************************************************************************************************************************************************************
skipping: [k8s-master3]
skipping: [k8s-master2]
skipping: [k8s-node1]
skipping: [k8s-node2]
skipping: [k8s-node3]
changed: [k8s-master1]

TASK [kubernetes : 重启 kubelet 服务] ***********************************************************************************************************************************************************
changed: [k8s-master1]
changed: [k8s-master2]
changed: [k8s-master3]
changed: [k8s-node1]
changed: [k8s-node2]
changed: [k8s-node3]

TASK [kubernetes : 暂停 30 秒] *****************************************************************************************************************************************************************
Pausing for 30 seconds
(ctrl+C then 'C' = continue early, ctrl+C then 'A' = abort)
ok: [k8s-master1]

TASK [kubernetes : 任务完成] ********************************************************************************************************************************************************************
ok: [k8s-master1] => {
    "msg": "任务完成"
}
ok: [k8s-master2] => {
    "msg": "任务完成"
}
ok: [k8s-master3] => {
    "msg": "任务完成"
}
ok: [k8s-node1] => {
    "msg": "任务完成"
}
ok: [k8s-node2] => {
    "msg": "任务完成"
}
ok: [k8s-node3] => {
    "msg": "任务完成"
}

PLAY RECAP **********************************************************************************************************************************************************************************k8s-master1                : ok=58   changed=42   unreachable=0    failed=0    skipped=5    rescued=0    ignored=1   
k8s-master2                : ok=54   changed=39   unreachable=0    failed=0    skipped=8    rescued=0    ignored=1   
k8s-master3                : ok=54   changed=39   unreachable=0    failed=0    skipped=8    rescued=0    ignored=1   
k8s-node1                  : ok=45   changed=31   unreachable=0    failed=0    skipped=11   rescued=0    ignored=1   
k8s-node2                  : ok=45   changed=31   unreachable=0    failed=0    skipped=11   rescued=0    ignored=1   
k8s-node3                  : ok=45   changed=31   unreachable=0    failed=0    skipped=11   rescued=0    ignored=1   


```

