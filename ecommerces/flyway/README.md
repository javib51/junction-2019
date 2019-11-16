Welcome to Flyway.
------------------
Database Migrations Made Easy [Download](https://flywaydb.org/download/#downloads).

Add to existing DB
-----------------------
We are going to use [**baseline**](https://flywaydb.org/documentation/command/baseline).
For assuming that the db already have all the flyway versions:
```bash
flyway -configFiles=flyway/flyway-local.conf -baselineVersion=<base version> baseline
``` 
For more advance use cases, check the [documentation](https://flywaydb.org/documentation/commandline/baseline).

Development environment
-----------------------
**Do not** run it on this way in **production**
```bash
flyway -configFiles=flyway-local.conf migrate
```

Execute in Production
---------------------
You just need to execute 
```bash
./flyway migrate -url="<db-url>" -user="<db-user>" -password="<db-pwd>"
```
Example:
```bash
flyway clean migrate -url="jdbc:mysql://172.17.0.3?autoReconnect=true&useSSL=false" -user=root -password=r00t55
```

It sets ms-auth schema for default. If you need to change it, conf file is ```conf/flyway.conf```

If you are using MySQL version >= 8.0, there will be an error. To solve it, check [this](https://stackoverflow.com/questions/51670095/docker-flyway-mysql-8-client-does-not-support-authentication-protocol-requeste) stackoverflow post.
