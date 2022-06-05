## Test Configuration

The image itself is a alpine image. Which means we need to install some utilities in order to actually test our 
configuration. This can be done by using `EXEC` to enter the container.

```
docker exec -it freeradius sh
```

Follow up by installing the utilities needed.
```
apk add freeradius-utils
```

Follow up with testing your configuration
```
radtest bob test 127.0.0.1 0 testing123
```

Note: the test parameters provided in the last comment should work with the default provided configuration
