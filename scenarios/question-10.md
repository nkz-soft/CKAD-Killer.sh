# ✅ CKAD Practice - Question 10: Service and Pod Exposure in Namespace

## 🖥️ Scenario Description

This question tests your ability to create a Service and Pod, configure correct labels/selectors, perform port redirection, and validate connectivity—all in a specific namespace.

**Connect to instance:**

```bash
ssh ckad9043
```

---

## 🧩 Task

You are assisting **Team Pluto** with internal networking.

**In the `pluto` namespace:**

1. **Create a Pod** named `project-plt-6cc-api` using the image `nginx:1.17.3-alpine`.

  * The Pod must have the label:

    ```
    project: plt-6cc-api
    ```

2. **Create a ClusterIP Service** named `project-plt-6cc-svc` that:

  * Selects Pods with label `project=plt-6cc-api`
  * Forwards TCP traffic from port **3333** on the Service to port **80** of the Pod

3. **Test the Service:**

  * Run a temporary Pod (e.g., using `nginx:alpine`) in the same namespace.
  * Use `curl` to fetch from `project-plt-6cc-svc:3333`
  * Save the output of the curl command to:

    ```
    /opt/course/10/service_test.html
    ```
  * Get the logs from the Pod `project-plt-6cc-api` (should show the incoming request), and save them to:

    ```
    /opt/course/10/service_test.log
    ```

---

## 📁 Validation

* Check that the Pod and Service exist and are running in `pluto`:

  ```bash
  kubectl get pod -n pluto
  kubectl get svc -n pluto
  ```
* Confirm the correct label on the Pod:

  ```bash
  kubectl get pod project-plt-6cc-api -n pluto --show-labels
  ```
* Confirm port forwarding:

  ```bash
  kubectl describe svc project-plt-6cc-svc -n pluto
  ```
* Check the output files:

  ```bash
  cat /opt/course/10/service_test.html
  cat /opt/course/10/service_test.log
  ```

---

## 🧹 Cleanup (Optional)

```bash
kubectl delete svc project-plt-6cc-svc -n pluto
kubectl delete pod project-plt-6cc-api -n pluto
kubectl delete pod tmp-curl -n pluto # If you named your test Pod
```

---

**Status:** ✅ Ready for practice

**Tags:** `services` `pods` `labels` `curl` `logs` `namespace`
