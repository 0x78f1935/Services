## Test Configuration
```
docker exec openldap ldapsearch -x -H ldap://localhost -b dc=example,dc=org -D "cn=admin,dc=example,dc=org" -w admin
```

Note: the test parameters provided in the example should work with the default provided configuration
