# ✅ CKAD Practice - Question 3

## 🖥️ Scenario Description

This question involves creating and managing a Kubernetes Job in a specific namespace with detailed configuration.

**Connect to instance:**

```bash
ssh ckad7326
```

---

## 🧩 Task

You are working with **Team Neptune**. They need a Kubernetes Job defined in a YAML template located at:

```
/opt/course/3/job.yaml
```

The Job should meet the following requirements:

* **Name:** `neb-new-job`
* **Namespace:** `neptune`
* **Image:** `busybox:1.31.0`
* **Command:** `sleep 2 && echo done`
* **Completions:** 3 (i.e., it should run 3 times total)
* **Parallelism:** 2 (i.e., 2 pods can run in parallel)
* **Label on pods:** `id: awesome-job`
* **Container name:** `neb-new-job-container`

Once the YAML is created:

1. **Start the Job** by applying the YAML.
2. **Check the Job's execution history.**

---

## 🧠 Solution

<details>
<summary>Click to reveal solution</summary>

### 1. Create the namespace (if not already exists):

```bash
kubectl create namespace neptune
```

### 2. Create the job YAML at `/opt/course/3/job.yaml`:

```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: neb-new-job
  namespace: neptune
spec:
  completions: 3
  parallelism: 2
  template:
    metadata:
      labels:
        id: awesome-job
    spec:
      containers:
      - name: neb-new-job-container
        image: busybox:1.31.0
        command: ["/bin/sh", "-c", "sleep 2 && echo done"]
      restartPolicy: Never
```

### 3. Apply the Job:

```bash
kubectl apply -f /opt/course/3/job.yaml
```

### 4. Verify the job and pod history:

```bash
kubectl get jobs -n neptune
kubectl get pods -n neptune -l id=awesome-job
kubectl describe job neb-new-job -n neptune
```

</details>

---

## 📁 Validation

To verify the Job:

```bash
kubectl get job neb-new-job -n neptune
kubectl get pods -n neptune -l id=awesome-job
```

You should see multiple pods and `Succeeded` status if everything runs correctly.

---

## 🧹 Cleanup (Optional)

```bash
kubectl delete job neb-new-job -n neptune
kubectl delete namespace neptune
```

---

**Status:** ✅ Ready for practice

**Tags:** `jobs` `batch` `kubectl` `labels` `namespaces`
