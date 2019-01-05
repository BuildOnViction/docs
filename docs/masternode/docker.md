Alternatively to using our simple tool `tmn`, people or companies with existing infrastructure might want to directly run our docker images for more flexibility.

To achieve that, two containers are needed:

1. tomochain/node - The container who run the TomoChain client
2. tomochain/telegraf - The container who send the performance metrics to be displayed on TomoMaster

## `tomochain/node`

This image is running the [TomoChain go client](https://github.com/tomochain/tomochain).

### Tags

| Environment | Tag        |
| ----------- | ---------- |
| Testnet     | `:testnet` |
| Mainnet     | `:stable`  |

### Environment variables

| Variable        | Required | Default         | Example                                    | Description                                                                                                      |
| --------------- | -------- | --------------- | ------------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| `IDENTITY`      | False    | Random name     | `my-super-node`                            | The name of your masternode                                                                                     |
| `PASSWORD`      | False    | Random password | `S5G@fS3A8+*g-)ftYc`                       | The password used by the the client to localy encrypt its account                                               |
| `PRIVATE_KEY`   | False    | Random account  | `0xa3f5195...`                             | The private key of the account who will identify the node and receive txs fees                                  |
| `BOOTNODES`     | True     | None            | `enode://4d3...@1.2.3.4:30301,enode://...` | The comma separated list of bootnodes. Find them [here](https://docs.tomochain.com/general/networks/)           |
| `VERBOSITY`     | False    | 3               | `4`                                        | The level of logging (default one should be enough)                                                             |
| `NETWORK_ID`    | False    | 89              | `88`                                       | The network id of the join your node is joining. Find them [here](https://docs.tomochain.com/general/networks/) |
| `WS_SECRET`     | False    | None            | `d$M4J4\5gLAz%Zjn>%`                       | The password to send data to the stats website                                                                  |
| `NETSTATS_HOST` | False    | netstats-server | `https://stats.tomochain.com`              | The stats website to report to, regarding to your environment                                                   |
| `NETSTATS_PORT` | False    | 3000            | `443`                                      | The port used by the stats website (usually 443)                                                                |
| `ANNOUNCE_TXS`  | False    | None            | `True`                                     | Enable reporting transactions via RPC/WS                                                                        |

### Ports

| Exposed | Protocol | Description               |
| ------- | --------- | ------------------------- |
| `30303` | tcp       | TomoChain client p2p port |
| `30303` | udp       | TomoChain client p2p port |
| `8545`  | tcp       | Blockchain RPC            |
| `8546`  | tcp       | Blockchain WS             |

### Filesystem

| Path                  | Content   |
| --------------------- | --------- |
| `/tomochain/data`     | Chaindata |
| `/tomochain/keystore` | Accounts  |

### Examples
`docker run`

```bash
docker run -d --name masternode \
  -e IDENTITY=$MASTERNODE_NAME \
  -e PRIVATE_KEY=$MASTERNODE_PK \
  -e BOOTNODES=$BOOTNODES \
  -e NETSTATS_HOST=stats.tomochain.com \
  -e NETSTATS_PORT=443 \
  -e WS_SECRET=$STATS_WS_SECRET \
  -p 30303:30303 \
  -p 30303:30303/udp \
  -v chaindata:/tomochain/data \
  tomochain/node:stable
```

`docker-compose.yml`

```yml
version: "3.4"
services:
  masternode:
    image: tomochain/node:stable
    environment:
      IDENTITY: $MASTERNODE_NAME
      PRIVATE_KEY: $MASTERNODE_PK
      BOOTNODES: $BOOTNODES
      NETSTATS_HOST: stats.tomochain.com
      NETSTATS_PORT: 443
      WS_SECRET: $STATS_WS_SECRET
    ports:
      - 30303:30303
      - 30303:30303/udp
    volumes:
      - chaindata:/tomochain/data
```

## `tomochain/telegraf`

!!! warning
    Please set the container hostname to the node coinbase address without the heading 0x and all lowercase.

### Tags

| Environment | Tag        |
| ----------- | ---------- |
| Testnet     | `:testnet` |
| Mainnet     | `:stable`  |

### Environment variables

| Variable           | Required | Default         | Example                         | Description                                                                                                          |
| ------------------ | -------- | --------------- | ------------------------------- | ------------------------------------------------------------------------------------------------------------------- |
| `METRICS_ENDPOINT` | True     | None            | `https://metrics.tomochain.com` | The address of the metrics endpoint you want to use. Find them [here](https://docs.tomochain.com/general/networks/) |                                                                               |
| `HOST_SYS`         | True     | /rootfs/sys     | `/rootfs/sys`                   | The sys repertory bind to host                                                                                      |
| `HOST_PROC`        | True     | /rootfs/proc    | `/rootfs/proc`                  | The proc repertory bind to host                                                                                     |
| `HOST_ETC`         | True     | /rootfs/etc     | `/rootfs/etc`                   | The etc repertory bind to host                                                                                      |

### Volumes

| Path           | Content             |
| -------------- | ------------------- |
| `HOST_SYS`     | Host sys repertory  |
| `HOST_PROC`    | Host proc repertory |
| `HOST_ETC`     | Host etc repertory  |

### Filesystem

| Path                   | Content                 |
| ---------------------- | ----------------------- |
| `/var/run/docker.sock` | Bind the docker socket  |

### Examples
`docker run`

```bash
docker run -d --name metrics \
  --hostname $HOSTNAME \
  -e METRICS_ENDPOINT=$METRICS_ENDPOINT \
  -v HOST_SYS:/rootfs/sys \
  -v HOST_PROC:/rootfs/proc \
  -v HOST_ETC:/rootfs/etc \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  tomochain/telegraf:stable
```

`docker-compose.yml`

```yml
version: "3.4"
services:
  metrics:
    image: tomochain/telegraf:stable
    hostname: $HOSTNAME
    environment:
      METRICS_ENDPOINT: $METRICS_ENDPOINT
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - /sys:/rootfs/sys:ro
      - /proc:/rootfs/proc:ro
      - /etc:/rootfs/etc:ro
```
