## Initializing a Cassandra Docker container with keyspace and data

Creating a cassandra image with initial keyspace and values populated.

The `entrypoint.sh` is able to execute any cql file located in `/docker-entrypoint-initdb.d/`.

Add any `*.sh` or `*.cql` scripts inside `/docker-entrypoint-initdb.d`, but note that:

* `*.sh` files will be executed **BEFORE** launching cassandra
* `*.cql` files will be executed (with `cqlsh -f`) **AFTER** cassandra started

Files are executed in name order (ls * | sort)

## How to use

1. build the image: ` docker build -t demoapp-cassandra-image-dev .`
2. run the image: `docker run --rm -p 9042:9042 --name demoapp-cassandra-container-dev -d demoapp-cassandra-image-dev`

Note that the scripts in `/docker-entrypoint.sh` will only be called on startup. If you decide to persist the data using a volume,
this will work all right: the scripts won't be executed when you boot your container a second time. By using a volume, I mean, e.g.:

```bash
docker run --rm -d \
    -p 9042:9042 \
    -v $PWD/data:/var/lib/cassandra \
    --name demoapp-cassandra-container-dev \
    demoapp-cassandra-dev
```

### List containers
docker ps

### Stop container
`docker stop CONTAINER_ID`

### How to see logs
`docker logs CONTAINER_ID`

### How to see logs and follow log output (like tail)
`docker logs CONTAINER_ID -f`

## Inspired by
https://gist.github.com/derlin


