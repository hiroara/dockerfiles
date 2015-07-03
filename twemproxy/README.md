# hiroara/twemproxy repo

## Get started

At first, save following configuration file in `$(pwd)/etc/nutcracker.yml`.

```
alpha:
  listen: 0.0.0.0:6379
  hash: fnv1a_64
  distribution: ketama
  auto_eject_hosts: true
  redis: true
  redis_db: 0
  server_retry_timeout: 2000
  server_failure_limit: 2
  servers:
    - redis.host:6379:1
```

Then run Redis container and twemproxy.

    $ docker run -d --name redis redis:2
    $ docker run -it --rm --link redis:redis.host -v $(pwd)/etc:/etc/twemproxy -p 6379:6379 hiroara/twemproxy /usr/bin/nutcracker -c /etc/twemproxy/nutcracker.yml

So, you can connect to redis server via twemproxy.

    $ redis-cli -h $DOCKER_HOST_IP -p 6379
