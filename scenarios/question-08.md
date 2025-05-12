# ✅ CKAD Practice - Question 8

## 🖥️ Scenario Description

This task involves analyzing a faulty Deployment rollout and performing a rollback.

**Connect to instance:**

```bash
ssh ckad7326
```

---

## 🧩 Task

In the `neptune` namespace, a Deployment named `api-new-c32` was recently updated by a developer, but the updated version never came online.

Your goal is to:

1. Check the **Deployment revision history** and identify a working revision.
2. **Rollback** to the last known good revision.
3. Find and **document the reason** why the new version failed to start, so Team Neptune can avoid this issue in the future.

---

## 🧠 Solution

<details>
<summary>Click to reveal solution</summary>

### 1. Inspect rollout history:

```bash
kubectl rollout history deployment api-new-c32 -n neptune
```

### 2. Check status and events:

```bash
kubectl describe deployment api-new-c32 -n neptune
kubectl get pods -n neptune -l app=api-new-c32
kubectl describe pod <pod-name> -n neptune
```

Look for error messages in the events or container startup logs.

### 3. View logs (if pod is crashing):

```bash
kubectl logs <pod-name> -n neptune
```

### 4. Rollback to previous revision:

```bash
kubectl rollout undo deployment api-new-c32 -n neptune
```

Or rollback to a specific revision:

```bash
kubectl rollout undo deployment api-new-c32 -n neptune --to-revision=<working-revision>
```

### 5. Check deployment status:

```bash
kubectl rollout status deployment api-new-c32 -n neptune
```

</details>

---

## 📁 Validation

Ensure the Deployment is running properly:

```bash
kubectl get deploy api-new-c32 -n neptune
kubectl get pods -n neptune -l app=api-new-c32
```

Confirm that Pods are ready and healthy.

---

## 🧹 Cleanup (Optional)

No cleanup required unless resetting the Deployment is needed.

---

**Status:** ✅ Ready for practice

**Tags:** `deployment` `rollback` `rollout` `troubleshooting` `revision`
