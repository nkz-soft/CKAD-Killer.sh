# ✅ CKAD Practice - Question 6

## 🖥️ Scenario Description

This question involves setting up a Kubernetes Pod with a readiness probe that checks for a file in the container.

**Connect to instance:**

```bash
ssh ckad5601
```

---

## 🧩 Task

Create a **Pod** with the following specifications:

* **Name:** `pod6`
* **Namespace:** `default`
* **Image:** `busybox:1.31.0`
* **Command to run:** `touch /tmp/ready && sleep 1d`
* **Readiness Probe:**

    * Should execute: `cat /tmp/ready`
    * `initialDelaySeconds`: 5
    * `periodSeconds`: 10

This probe will ensure the Pod is marked **ready** only after the file `/tmp/ready` is present (created by the command).

Once the Pod is created, **confirm** that it starts and becomes ready.

---

## 🧠 Solution

<details>
<summary>Click to reveal solution</summary>

### 1. Create a YAML manifest (pod6.yaml):

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod6
  namespace: default
spec:
  containers:
  - name: pod6-container
    image: busybox:1.31.0
    command: ["/bin/sh", "-c", "touch /tmp/ready && sleep 1d"]
    readinessProbe:
      exec:
        command: ["cat", "/tmp/ready"]
      initialDelaySeconds: 5
      periodSeconds: 10
```

### 2. Apply the manifest:

```bash
kubectl apply -f pod6.yaml
```

### 3. Confirm the Pod is running and ready:

```bash
kubectl get pod pod6
```

It should show `1/1` in the READY column after a few seconds.

</details>

---

## 📁 Validation

Check readiness status:

```bash
kubectl describe pod pod6
```

Look for events and status indicating readiness probe success.

---

## 🧹 Cleanup (Optional)

```bash
kubectl delete pod pod6
```

---

**Status:** ✅ Ready for practice

**Tags:** `probes` `readiness` `pods` `busybox` `kubectl`
