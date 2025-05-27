# 🚀 CKAD Exam Practice: Killer.sh-Inspired Scenarios

Welcome to the **CKAD Exam Practice Repository**! This project provides a curated set of practical exercises inspired by the [Killer.sh CKAD Simulator](https://killer.sh/ckad/), designed to help you prepare for the **Certified Kubernetes Application Developer (CKAD)** exam by the CNCF.

## 📘 About the Project

This repository aims to replicate the style and difficulty of the Killer.sh CKAD simulator by offering:

* 📂 Realistic, exam-style Kubernetes scenarios
* ⚙️ Task-based YAML and CLI exercises
* 🧠 Topic coverage based on the official [CKAD curriculum](https://github.com/cncf/curriculum)
* ✅ Verified answers and best-practice solutions

All exercises are intended for self-paced learning and to simulate real exam pressure under time constraints.

## 📈 Covered Topics

The repository includes tasks and examples across all core domains of the CKAD 2025 curriculum:

| Domain  | % Weight | Topics Covered                               |
| ------- |----------|----------------------------------------------|
| **1. Application Environment, Configuration and Security** | 25%      | ConfigMaps, Secrets, SecurityContext         |
| **2. Application Design and Build** | 20%      | Pods, Deployments, Sidecars, Init Containers |
| **3. Application Deployment** | 20%      | Helm, Kustomize, Blue/Green                  |
| **4. Services and Networking** | 20%      | Services, DNS, Network Policies              |
| **5. Application Observability and Maintenance** | 15%      | Probes, Logging, Monitoring                  |

## 🏁 How to Use

1. **Clone the repository**:

   ```bash
   git clone https://github.com/nkz-soft/CKAD-Killer.sh.git
   cd CKAD-Killer.sh
   ```

2. **Spin up a local Kubernetes cluster** (e.g., with Minikube, kind, or k3d). We have prepared for you a [pre-configured cluster](./k0s-ansible/README.md) for CKAD that you can deploy with Ansible.

3. **Follow each scenario** in the `scenarios/` directory. Each task includes:

   * 💡 Problem statement
   * 📁 Required YAML files or commands
   * ✅ Expected output or validation steps

4. **Check solutions** in the `solutions/` folder.

## 📦 Folder Structure

```
ckad-killer-practice/
├── scenarios/
│   ├── question-01.md
│   ├── question-02.md
│   └── ...
└── README.md
```

## 🚰 Prerequisites

* Kubernetes 1.29+
* `kubectl` CLI installed and configured
* Basic understanding of Linux CLI and YAML

## 🤝 Contributions

Contributions are welcome! If you’ve created your own scenarios or want to improve existing ones:

1. Fork the repository
2. Create a feature branch
3. Submit a pull request with your additions

Please follow the existing structure and provide a `README.md` per scenario when possible.

## 📚 References

* [CKAD Curriculum](https://github.com/cncf/curriculum)
* [Kubernetes Official Docs](https://kubernetes.io/docs/)
* [Killer.sh CKAD Simulator](https://killer.sh/ckad/)
* [CNCF Certification Portal](https://training.linuxfoundation.org/certification/)
* [Certified Kubernetes Application Developer (CKAD) - Killer Shell exam simulation - Solution walk-through.
](https://www.youtube.com/playlist?list=PLpbwBK0ptssyIgAoHR-611wt3O9wobS8T)

## 🧪 License

This project is licensed under the [MIT License](LICENSE). All scenario names and designs are original and provided for educational use only.

---

Happy learning and good luck on your CKAD journey! 🎓
