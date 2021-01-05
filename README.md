### <span style="color: black">&#x1F535; Install kubernetes on Vagrant </span>

<span style="color: blue">&#x1F535; Start  </span>

> vagrant up

### Please visit  kubernetes dashboard

> <kworker-ip>:32333

```
kubectl get secret --all-namespaces | grep dashboard-admin

kubectl describe secret dashboard-admin-token-<> -n kube-system

copy token

```

### Now use calico, but you can uncomment flannel
