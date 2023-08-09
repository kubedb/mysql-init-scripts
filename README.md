# MySQL Init Scripts

## Load scripts from Git repo

```console
> kubectl apply -f load-scripts.yaml
persistentvolumeclaim/mysql-scripts unchanged

> kubectl get pods
NAME           READY   STATUS    RESTARTS   AGE
load-scripts   2/2     Running   0          6s

> kubectl exec -it load-scripts -c server -- ls -l /git/current/
total 16
-rw-r--r--    1 65533    nogroup        447 Aug  9 02:49 README.md
-rw-r--r--    1 65533    nogroup        543 Aug  9 02:49 init.sql
-rw-r--r--    1 65533    nogroup       1740 Aug  9 02:49 load-scripts.yaml
-rw-r--r--    1 65533    nogroup        527 Aug  9 02:49 script2.sql

> kubectl delete pod load-scripts
pod "load-scripts" deleted

> kubectl get pvc
NAME            STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
mysql-scripts   Bound    pvc-fc859073-b73a-4639-a83a-ea4541649baf   1Gi        RWO            standard       2m10s
```

## Create MySQL database with startup script

```console
> kubectl apply -f mysql.yaml
```
