This guide will show you how to start a TomoX DEX on your server.

To start, you need to download TomoX-SDK source code, it includes two parts:

* [TomoX-SDK](https://github.com/tomochain/tomox-sdk): Backend server, API, it requires Mongodb database with rabbitmq.
* [TomoX-SDK-UI](https://github.com/tomochain/tomox-sdk-ui): Frontend - DEX UI, requires NodeJs, React


### Prerequisite ###

#### Minimum hardware and software requirements ####

* Processing transactions is mostly CPU bound. Therefore we recommend running CPU
optimized servers.(You can check our base recommendations to create your
fullnode [here](https://docs.tomochain.com/masternode/requirements/))

    * Directly facing internet (public IP, no NAT)
    * 16 cores CPU
    * 32 GB of RAM
    * SSD Storage

    **|** <span style="color:green"> If you are running a node in Testnet, 4CPU/16GB
    of RAM is sufficient. </span> **|**

#### Application platform ####

* Go 1.12 or higher
* Docker and docker-compose with the latest version
* Nodejs 8.16.x or higher
* Nginx

#### Networks ####

Your server need to open these ports:

* 80/443 for HTTP/HTTPs
* 30303 for fullnode

#### All IT systems require maintenance ####

It is of the owner's responsability to ensure over time that your node has enough:

* Disk space to store the new blockchain data
* Processing power to keep the chain operating at optimal speed
* Ponitoring to be able to react quickly in case of problem
* Security mesures like firewalling, os security patching, ssh via keypairs, etc.

This is a non exhaustive list.

## Prepare RabbitMQ, MongoDB and TomoX fullnode

Use this [guide](/masternode/tomox-fullnode/) to run your fullnode and MongoDB on server.

And run RabbitMQ:

```bash
docker run -d -p 5672:5672 --name rabbitmq rabbitmq:3.8
```

## Basic Deployment ##

### TomoX SDK Backend

Clone [tomox-sdk](https://github.com/tomochain/tomox-sdk.git) to your server:

`$ git clone https://github.com/tomochain/tomox-sdk.git`

Go to `tomox-sdk` and create and edit your config file.
```
cd tomox-sdk
cp config/config.yaml.example config/config.yaml
```

We have some parameter needs to be change.

* `exchange_address` : Your DEX coinbase (the address you used to register a DEX on TomoRelayer)
* `contract_address` : TomoRelayer smart contract address (Testnet: `0xe7c16037992bEcAFaeeE779Dacaf8991637953F3`)

After customized your own config, you can build SDK backend

```bash
cd tomox-sdk
GO111MODULE=on
go mod download
go build .
```

And run it:
```
./tomox-sdk
```
To run tomox-sdk as daemon service, you can use `pm2`, `supervisord` or `systemd`.

### TomoX SDK UI ###

Clone [tomox-sdk-ui](https://github.com/tomochain/tomox-sdk-ui.git) to your server:
```bash
git clone https://github.com/tomochain/tomox-sdk-ui.git
```

Build the site:

```bash
cd tomox-sdk-ui
yarn install && yarn build
```

Your DEX UI is created into `./buid` directory. You can setup web server (nginx) and domain to publish your site to internet.

