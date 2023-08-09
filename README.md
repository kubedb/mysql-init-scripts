# MySQL Init Scripts

## Load scripts from Git repo

```console
> kubectl apply -f load-scripts.yaml
persistentvolumeclaim/mysql-scripts unchanged

> kubectl get pods -n demo
NAME           READY   STATUS    RESTARTS   AGE
load-scripts   2/2     Running   0          6s

> kubectl exec  -n demo -it load-scripts -c server -- ls -l /git/current/
total 16
-rw-r--r--    1 65533    nogroup        447 Aug  9 02:49 README.md
-rw-r--r--    1 65533    nogroup        543 Aug  9 02:49 init.sql
-rw-r--r--    1 65533    nogroup       1740 Aug  9 02:49 load-scripts.yaml
-rw-r--r--    1 65533    nogroup        527 Aug  9 02:49 script2.sql

> kubectl delete pod -n demo load-scripts
pod "load-scripts" deleted

> kubectl get pvc -n demo
NAME            STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS   AGE
mysql-scripts   Bound    pvc-fc859073-b73a-4639-a83a-ea4541649baf   1Gi        RWO            standard       2m10s
```

## Create MySQL database with startup script

```console
> kubectl apply -f mysql.yaml
```

```console
> kubectl view-secret -n demo m1-auth --all

password=Id2yUpX6Juw0O3!M
username=root
```

```console
> kubectl exec -n demo -it m1-0 -- bash
Defaulted container "mysql" out of: mysql, mysql-init (init)

sh-4.4# mysql -uroot -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 20
Server version: 8.0.32 MySQL Community Server - GPL

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use mysql;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+------------------------------------------------------+
| Tables_in_mysql                                      |
+------------------------------------------------------+
| columns_priv                                         |
| component                                            |
| db                                                   |
| default_roles                                        |
| demo_table                                           |
| engine_cost                                          |
| func                                                 |
| general_log                                          |
| global_grants                                        |
| gtid_executed                                        |
| help_category                                        |
| help_keyword                                         |
| help_relation                                        |
| help_topic                                           |
| innodb_index_stats                                   |
| innodb_table_stats                                   |
| kubedb_table                                         |
| ndb_binlog_index                                     |
| password_history                                     |
| plugin                                               |
| procs_priv                                           |
| proxies_priv                                         |
| replication_asynchronous_connection_failover         |
| replication_asynchronous_connection_failover_managed |
| replication_group_configuration_version              |
| replication_group_member_actions                     |
| role_edges                                           |
| server_cost                                          |
| servers                                              |
| slave_master_info                                    |
| slave_relay_log_info                                 |
| slave_worker_info                                    |
| slow_log                                             |
| tables_priv                                          |
| time_zone                                            |
| time_zone_leap_second                                |
| time_zone_name                                       |
| time_zone_transition                                 |
| time_zone_transition_type                            |
| user                                                 |
+------------------------------------------------------+
40 rows in set (0.01 sec)

mysql> select * from demo_table;
+----+-------+
| id | name  |
+----+-------+
|  1 | name1 |
|  2 | name2 |
|  3 | name3 |
+----+-------+
3 rows in set (0.00 sec)

mysql> select * from kubedb_table;
+----+-------+
| id | name  |
+----+-------+
|  1 | name1 |
|  2 | name2 |
|  3 | name3 |
+----+-------+
3 rows in set (0.00 sec)

mysql> \q;
Bye
```
