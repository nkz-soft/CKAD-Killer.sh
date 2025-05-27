# ✅ CKAD Practice - Question 5

## 🖥️ Scenario Description

This question involves locating and extracting a token from a Kubernetes ServiceAccount's associated Secret.

**Connect to instance:**

```bash
ssh ckad7326
```

---

## 🧩 Task

In the `neptune` namespace, Team Neptune has a ServiceAccount named `neptune-sa-v2`. Your coworker needs the token associated with this ServiceAccount.

Your objective:

* Find the **Secret** related to `neptune-sa-v2`
* Extract the **base64-decoded** token from that Secret
* Write the decoded token to the file:

  ```
  /opt/course/5/token
  ```

---

## 🧠 Solution

<details>
<summary>Click to reveal solution</summary>

### 1. Get the secret name associated with the ServiceAccount:

```bash
kubectl get sa neptune-sa-v2 -n neptune -o jsonpath='{.secrets[0].name}'
```

### 2. Use the secret name to extract the token:

```bash
kubectl get secret <secret-name> -n neptune -o jsonpath='{.data.token}' | base64 --decode > /opt/course/5/token
```

Replace `<secret-name>` with the actual secret name obtained from step 1.

</details>

---

## 📁 Validation

Check that the token was written and looks valid:

```bash
cat /opt/course/5/token
```

It should appear as a long JWT token.

---

## 🧹 Cleanup (Optional)

No cleanup required for this question.

---

**Status:** ✅ Ready for practice

**Tags:** `serviceaccount` `secrets` `kubectl` `jsonpath` `base64`
