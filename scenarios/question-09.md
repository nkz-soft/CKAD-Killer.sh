# ✅ CKAD Practice - Question 9: Pod to Deployment Conversion with Security Context

## 🖥️ Scenario Description

This task involves converting a standalone Pod into a managed Deployment and enhancing its security posture.

**Connect to instance:**

```bash
ssh ckad9043
```


## 🧩 Task Objectives

In the `pluto` namespace:

* Convert the existing Pod `holy-api` into a Deployment named `holy-api`
* The Deployment should have **3 replicas**
* The container's **securityContext** must include:

   * `allowPrivilegeEscalation: false`
   * `privileged: false`
* Delete the original Pod once the Deployment is working
* Save the Deployment manifest to:

```bash
/opt/course/9/holy-api-deployment.yaml
```

---

## 🧠 Solution

<details>
<summary>Click to reveal solution</summary>

### 1. Extract and convert the Pod manifest to a Deployment:

```bash
kubectl get pod holy-api -n pluto -o yaml > pod.yaml
```

Edit the file manually or use `kubectl create deployment --dry-run=client -o yaml` as a base.

### 2. Construct Deployment YAML with securityContext:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: holy-api
  namespace: pluto
spec:
  replicas: 3
  selector:
    matchLabels:
      app: holy-api
  template:
    metadata:
      labels:
        app: holy-api
    spec:
      containers:
      - name: <original-name>
        image: <original-image>
        ports:
        - containerPort: <original-port>
        securityContext:
          allowPrivilegeEscalation: false
          privileged: false
```

Save it:

```bash
vi /opt/course/9/holy-api-deployment.yaml
kubectl apply -f /opt/course/9/holy-api-deployment.yaml
```

### 3. Delete the original Pod:

```bash
kubectl delete pod holy-api -n pluto
```

</details>

---

## 📁 Validation

Verify the Deployment is running with 3 replicas:

```bash
kubectl get deployment holy-api -n pluto
kubectl get pods -n pluto -l app=holy-api
```

Inspect one Pod to confirm security settings:

```bash
kubectl get pod -n pluto -l app=holy-api -o jsonpath='{.items[0].spec.containers[0].securityContext}'
```

---

## 🧽 Optional Cleanup

```bash
kubectl delete deployment holy-api -n pluto
kubectl delete namespace pluto
```

---

**Status:** ✅ Ready for practice

**Tags:** `deployment`, `pod`, `conversion`, `replicas`, `securityContext`, `namespace`
