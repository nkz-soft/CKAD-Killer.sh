# ✅ CKAD Practice - Question 7

## 🖥️ Scenario Description

This task involves locating a running Pod and migrating it from one namespace to another.

**Connect to instance:**

```bash
ssh ckad7326
```

---

## 🧩 Task

Team Neptune is taking over an e-commerce system called `my-happy-shop` previously managed by Team Saturn.

Your goal:

* **Find the Pod** associated with `my-happy-shop` in the `saturn` namespace
* **Move the Pod** to the `neptune` namespace

**Notes:**

* You may shut down and recreate the Pod
* It’s acceptable to extract and reapply its YAML manifest in the new namespace

---

## 🧠 Solution

<details>
<summary>Click to reveal solution</summary>

### 1. Locate the Pod:

```bash
kubectl get pods -n saturn | grep my-happy-shop
```

### 2. Export the Pod manifest:

```bash
kubectl get pod <pod-name> -n saturn -o yaml > pod.yaml
```

### 3. Edit the manifest:

* Change `namespace: saturn` → `namespace: neptune`
* Remove these fields:

    * `metadata.resourceVersion`
    * `metadata.uid`
    * `metadata.creationTimestamp`
    * `status`

### 4. Apply in the new namespace:

```bash
kubectl apply -f pod.yaml
```

### 5. Delete the original Pod:

```bash
kubectl delete pod <pod-name> -n saturn
```

</details>

---

## 📁 Validation

Check if the Pod is running in the `neptune` namespace:

```bash
kubectl get pods -n neptune
```

---

## 🧹 Cleanup (Optional)

```bash
kubectl delete pod <pod-name> -n neptune
```

---

**Status:** ✅ Ready for practice

**Tags:** `namespace` `pods` `migration` `kubectl`
