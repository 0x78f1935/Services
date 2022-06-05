## Test Configuration
Assuming the docker container is actually running, execute the following command in a new terminal to test the config:
```
docker exec openldap ldapsearch -x -H ldap://localhost -b dc=example,dc=org -D "cn=admin,dc=example,dc=org" -w admin
```

Note: the test parameters provided in the example should work with the default provided configuration
