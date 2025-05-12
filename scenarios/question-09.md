# ✅ CKAD Practice - Question 9

## 🖥️ Scenario Description

This task tests your ability to use AppArmor profiles in a Kubernetes cluster and perform node-level and workload-level configuration.

### Step 1: Set context for the correct cluster

```bash
kubectl config use-context workload-prod
```

### Step 2: Connect to the target Node

```bash
ssh cluster1-node1
```

---

## 🧩 Task Overview

1. **Install AppArmor profile** from `/opt/course/9/profile` on Node `cluster1-node1`
2. **Label the node** with: `security=apparmor`
3. **Create a Deployment** named `apparmor` in the `default` namespace with:

    * One replica using image: `nginx:1.19.2`
    * NodeSelector: `security=apparmor`
    * Container named `c1` with the AppArmor profile enabled
4. **Collect logs** from the Pod and write to:

   ```
   /opt/course/9/logs
   ```

---

## 🧠 Solution

<details>
<summary>Click to reveal solution</summary>

### 1. Install AppArmor profile (on `cluster1-node1`):

```bash
sudo apt-get update && sudo apt-get install -y apparmor apparmor-utils
sudo cp /opt/course/9/profile /etc/apparmor.d/my-nginx-profile
sudo apparmor_parser -r /etc/apparmor.d/my-nginx-profile
```

### 2. Label the Node (from control plane):

```bash
kubectl label node cluster1-node1 security=apparmor
```

### 3. Create Deployment with AppArmor annotation:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: apparmor
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: apparmor
  template:
    metadata:
      labels:
        app: apparmor
      annotations:
        container.apparmor.security.beta.kubernetes.io/c1: localhost/my-nginx-profile
    spec:
      nodeSelector:
        security: apparmor
      containers:
      - name: c1
        image: nginx:1.19.2
```

Apply it:

```bash
kubectl apply -f apparmor-deployment.yaml
```

### 4. Fetch logs from the Pod:

```bash
POD_NAME=$(kubectl get pods -l app=apparmor -o jsonpath='{.items[0].metadata.name}')
kubectl logs $POD_NAME > /opt/course/9/logs
```

</details>

---

## 📁 Validation

Confirm:

* The Deployment is created and scheduled to the correct node
* The AppArmor profile is active
* The Pod logs are saved to `/opt/course/9/logs`

```bash
kubectl get pods -o wide
kubectl describe pod <pod-name>
cat /opt/course/9/logs
```

---

## 🧹 Cleanup (Optional)

```bash
kubectl delete deployment apparmor
sudo rm /etc/apparmor.d/my-nginx-profile
```

---

**Status:** ✅ Ready for practice

**Tags:** `apparmor` `security` `deployment` `nodeSelector` `logs` `profiling`
