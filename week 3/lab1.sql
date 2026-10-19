Microsoft Windows [Version 10.0.26200.9711]
(c) Microsoft Corporation. All rights reserved.

C:\Users\bryan>mysql -u root -p
'mysql' is not recognized as an internal or external command,
operable program or batch file.

C:\Users\bryan>cd C:\Users\bryan\Downloads\Programs\mysql-8.0.46-winx64\mysql-8.0.46-winx64

C:\Users\bryan\Downloads\Programs\mysql-8.0.46-winx64\mysql-8.0.46-winx64>mysql -u root -p
'mysql' is not recognized as an internal or external command,
operable program or batch file.

C:\Users\bryan\Downloads\Programs\mysql-8.0.46-winx64\mysql-8.0.46-winx64>cd C:\ProgramData\Microsoft\Windows\Start Menu\Programs\MySQL

C:\ProgramData\Microsoft\Windows\Start Menu\Programs\MySQL>mysql -u root -p
'mysql' is not recognized as an internal or external command,
operable program or batch file.

C:\ProgramData\Microsoft\Windows\Start Menu\Programs\MySQL>cd C:\Program Files\MySQL\MySQL Server 8.0\bin
The system cannot find the path specified.

C:\ProgramData\Microsoft\Windows\Start Menu\Programs\MySQL>cd C:\Program Files\MySQL\MySQL Server 8.0
The system cannot find the path specified.

C:\ProgramData\Microsoft\Windows\Start Menu\Programs\MySQL>cd C:\Users\bryan\Downloads\Programs\mysql-8.0.46-winx64\mysql-8.0.46-winx64\bin

C:\Users\bryan\Downloads\Programs\mysql-8.0.46-winx64\mysql-8.0.46-winx64\bin>mysql -u root -p
Enter password: ********
ERROR 2003 (HY000): Can't connect to MySQL server on 'localhost:3306' (10061)

C:\Users\bryan\Downloads\Programs\mysql-8.0.46-winx64\mysql-8.0.46-winx64\bin>mysql -u root -p
Enter password: ********
ERROR 2003 (HY000): Can't connect to MySQL server on 'localhost:3306' (10061)

C:\Users\bryan\Downloads\Programs\mysql-8.0.46-winx64\mysql-8.0.46-winx64\bin>mysql -u root -p
Enter password: ********
ERROR 2003 (HY000): Can't connect to MySQL server on 'localhost:3306' (10061)

C:\Users\bryan\Downloads\Programs\mysql-8.0.46-winx64\mysql-8.0.46-winx64\bin>cd C:\Users\bryan\Downloads\Programs\mysql-8.0.46-winx64\mysql-8.0.46-winx64

C:\Users\bryan\Downloads\Programs\mysql-8.0.46-winx64\mysql-8.0.46-winx64\bin>cd C:\Program Files\MySQL\MySQL Server 8.0\bin
The system cannot find the path specified.

C:\Users\bryan\Downloads\Programs\mysql-8.0.46-winx64\mysql-8.0.46-winx64\bin>cd C:\Program Files\MySQL\MySQL Server 26.7\bin

C:\Program Files\MySQL\MySQL Server 26.7\bin>mysql -u root -p
Enter password: ********
ERROR 2003 (HY000): Can't connect to MySQL server on 'localhost:3306' (10061)

C:\Program Files\MySQL\MySQL Server 26.7\bin>mysql -u root -p
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 26.7.0 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database bryan
    -> \c
mysql> create database bryan;
Query OK, 1 row affected (0.587 sec)

mysql> create database sen307_12219;
Query OK, 1 row affected (0.315 sec)

mysql> show databases
    -> /c
    -> \c
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sen307_12219       |
| sys                |
+--------------------+
5 rows in set (0.021 sec)

mysql> select version();
+-----------+
| version() |
+-----------+
| 26.7.0    |
+-----------+
1 row in set (0.005 sec)

mysql> select current_user();
+----------------+
| current_user() |
+----------------+
| root@localhost |
+----------------+
1 row in set (0.005 sec)

mysql> select now();
+---------------------+
| now()               |
+---------------------+
| 2026-10-19 15:07:45 |
+---------------------+
1 row in set (0.007 sec)

mysql> status;
--------------
mysql  Ver 26.7.0 for Win64 on x86_64 (MySQL Community Server - GPL)

Connection id:          11
Current database:
Current user:           root@localhost
SSL:                    Cipher in use is TLS_AES_128_GCM_SHA256
Using delimiter:        ;
Server version:         26.7.0 MySQL Community Server - GPL
Protocol version:       10
Connection:             localhost via TCP/IP
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    cp850
Conn.  characterset:    cp850
TCP port:               3306
Binary data as:         Hexadecimal
Uptime:                 21 min 17 sec

Threads: 6  Questions: 51  Slow queries: 0  Opens: 203  Flush tables: 3  Open tables: 119  Queries per second avg: 0.039
--------------

mysql> show variables like 'port';
+---------------+-------+
| Variable_name | Value |
+---------------+-------+
| port          | 3306  |
+---------------+-------+
1 row in set (0.060 sec)

mysql> show tables;
ERROR 1046 (3D000): No database selected
mysql>
