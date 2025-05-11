# ✅ CKAD Practice - Question 4

## 🖥️ Scenario Description

This question tests your ability to manage Helm releases in a specific namespace.

**Connect to instance:**

```bash
ssh ckad7326
```

---

## 🧩 Task

You're working with **Team Mercury**, who asked you to perform the following Helm operations in the **`mercury` namespace**:

1. **Delete** the release named `internal-issue-report-apiv1`
2. **Upgrade** the release `internal-issue-report-apiv2` to any **newer version** of chart `bitnami/nginx` that is available
3. **Install** a new release `internal-issue-report-apache` using chart `bitnami/apache`

    * Set the number of Deployment **replicas to 2** using Helm values during installation
4. **Identify and delete** any Helm release stuck in `pending-install` state

---

## 🧠 Solution

<details>
<summary>Click to reveal solution</summary>

### 1. Delete release `internal-issue-report-apiv1`

```bash
helm uninstall internal-issue-report-apiv1 -n mercury
```

### 2. Upgrade release `internal-issue-report-apiv2`

```bash
helm repo update
helm search repo bitnami/nginx
helm upgrade internal-issue-report-apiv2 bitnami/nginx -n mercury
```

### 3. Install `internal-issue-report-apache` with 2 replicas:

```bash
helm install internal-issue-report-apache bitnami/apache \
  --set replicaCount=2 \
  -n mercury
```

If the namespace doesn’t exist:

```bash
kubectl create namespace mercury
```

### 4. Find broken releases:

```bash
helm list -n mercury --pending
```

Then delete the broken one:

```bash
helm uninstall <release-name> -n mercury
```

</details>

---

## 📁 Validation

To check current Helm releases:

```bash
helm list -n mercury
```

To check deployed deployments:

```bash
kubectl get deploy -n mercury
```

---

## 🧹 Cleanup (Optional)

```bash
helm uninstall internal-issue-report-apache -n mercury
helm uninstall internal-issue-report-apiv2 -n mercury
kubectl delete namespace mercury
```

---

**Status:** ✅ Ready for practice

**Tags:** `helm` `releases` `charts` `namespaces` `replicas`
