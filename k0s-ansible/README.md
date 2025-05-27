# 🚀 k0s Ansible Cluster Automation

Automate the provisioning and deployment of multiple lightweight Kubernetes (k0s) clusters using Ansible.

---

## 📦 Features

- Use [movd/k0s-ansible](https://github.com/movd/k0s-ansible) as a core role
- Multiple isolated cluster inventories (cluster1, cluster2, ...)
- Optional hostname setup per node

---

## 📂 Project Structure

```
k0s-ansible/
├── ansible.cfg
├── inventory/
│   ├── lab/
│   │   ├── inventory.yml
│   │   ├── group_vars/exam.yml
│   │   ├── group_vars/cluster.yml
│   │   └── group_vars/all.yml
├── playbooks/
│   └── create_lab.yml
```

---

## 🔧 Requirements

- Python 3.x
- Ansible 2.10+
- SSH access with root privileges to all target nodes
- Linux (Ubuntu/Debian recommended)

---

## 🚀 Usage

1. **Prepare your inventory**

```yaml
# inventory/lab/inventory.yml
hosts:
  ckad5601:
    ansible_host: 192.168.10.10
    hostname: ckad5601
  ckad7326:
    ansible_host: 192.168.10.11
    hostname: ckad7326
```

```yaml
# inventory/lab/group_vars/exam.yml
cluster_hosts_block: |
  192.168.100.11 ckad5601
  192.168.100.12 ckad7326
```

2. **Deploy k0s lab**

```bash
ansible-playbook -i inventory/lab/inventory.yml playbooks/create_lab.yml --ask-pass
```

3. **Verify**

```bash
ssh ckad5601
k get nodes
```

---

## 📘 References

- [k0sproject.io](https://k0sproject.io)
- [Ansible documentation](https://docs.ansible.com/)

---

