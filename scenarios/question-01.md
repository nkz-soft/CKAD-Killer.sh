# ✅ CKAD Practice - Question 1

## 🖥️ Scenario Description

This question involves getting a list of all namespaces in the Kubernetes cluster.

**Connect to instance:**

```bash
ssh ckad5601
```

---

## 🧩 Task

The DevOps team wants to retrieve a list of all **Namespaces** in the Kubernetes cluster. Your task is to:

* Get the list of **all namespaces** using the appropriate `kubectl` command.
* Save the output to the following file:

  ```
  /opt/course/1/namespaces
  ```

---

## 🧠 Solution

<details>
<summary>Click to reveal solution</summary>

```bash
ssh ckad5601
kubectl get ns > /opt/course/1/namespaces
```

</details>

---

## 📁 Validation

To verify your answer:

```bash
cat /opt/course/1/namespaces
```

You should see a list similar to:

```
NAME              STATUS   AGE
default           Active   ...
kube-node-lease   Active   ...
kube-public       Active   ...
kube-system       Active   ...
```

---

## 🧹 Cleanup (Optional)

No cleanup is needed for this task.

---

**Status:** ✅ Ready for practice

**Tags:** `core-concepts` `kubectl` `namespaces`
