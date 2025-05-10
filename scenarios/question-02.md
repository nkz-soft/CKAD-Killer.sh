# ✅ CKAD Practice - Question 2

## 🖥️ Scenario Description

In this question, you'll work on a specific instance to perform a basic Pod creation task and provide a reusable command.

**Connect to instance:**

```bash
ssh ckad5601
```

---

## 🧩 Task

1. Create a Pod named `pod1` in the **default namespace** using the image `httpd:2.4.41-alpine`.

   * The container inside the Pod should be named `pod1-container`.

2. Your manager wants a reusable command to manually check the status of this Pod. Save a `kubectl` command that outputs the Pod's status into:

   ```
   /opt/course/2/pod1-status-command.sh
   ```

---

## 🧠 Solution

<details>
<summary>Click to reveal solution</summary>

### 1. Create the Pod:

```bash
kubectl run pod1 \
  --image=httpd:2.4.41-alpine \
  --restart=Never \
  --overrides='{
    "apiVersion": "v1",
    "spec": { "containers": [{ "name": "pod1-container", "image": "httpd:2.4.41-alpine" }] }
  }' \
  --dry-run=client -o yaml | kubectl apply -f -
```

Or you can define it with a YAML file (optional):

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: pod1
  namespace: default
spec:
  containers:
  - name: pod1-container
    image: httpd:2.4.41-alpine
```

### 2. Save the status check command:

```bash
echo "kubectl get pod pod1 -o jsonpath='{.status.phase}'" > /opt/course/2/pod1-status-command.sh
chmod +x /opt/course/2/pod1-status-command.sh
```

</details>

---

## 📁 Validation

To check your Pod:

```bash
kubectl get pod pod1
```

To check your saved command:

```bash
bash /opt/course/2/pod1-status-command.sh
```

You should see `Running`, `Pending`, or another status string.

---

## 🧹 Cleanup (Optional)

```bash
kubectl delete pod pod1
```

---

**Status:** ✅ Ready for practice

**Tags:** `core-concepts` `pods` `kubectl` `scripting`
