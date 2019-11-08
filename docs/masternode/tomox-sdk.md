This guide will show you how to start a TomoX DEX on your server.

To start, you need to download TomoX-SDK source code, and it includes two parts:

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
* Docker with the latest version
* Nodejs 8.16.x or higher
* Nginx

#### Networks ####

Your server needs to open these ports:

* 80/443 for HTTP/HTTPs
* 30303 for fullnode

#### All IT systems require maintenance ####

It is of the owner's responsibility to ensure over time that your node has enough:

* Disk space to store the new blockchain data
* Processing power to keep the chain operating at optimal speed
* Monitoring to be able to react quickly in case of a problem
* Security mesures like firewalling, os security patching, ssh via keypairs, etc.


## Prepare RabbitMQ, MongoDB, and TomoX fullnode

Run MongoDB and TomoX Fullnode:

Use this [guide](/masternode/tomox-fullnode/) to run your fullnode and MongoDB on the server.

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

We have some parameter that needs to be changed.

* `exchange_address` : Your DEX coinbase (the address you used to register a DEX on TomoRelayer)
* `contract_address` : TomoRelayer smart contract address (Testnet: `0xe7c16037992bEcAFaeeE779Dacaf8991637953F3`)

After customizing your config, you can build SDK backend

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
Go to `tomox-sdk-ui` to update the `env` file:
```
cd tomox-sdk-ui
cp .env.sample .env
```
There are some parameters that need to be changed:

- `REACT_APP_ENGINE_HTTP_URL`: url backend, `http://[SERVER_IP_OR_DOMAIN]/api`
- `REACT_APP_ENGINE_WS_URL`: url websocket backend, `ws://[SERVER_IP_OR_DOMAIN]/socket`

You need to have `yarn` and `sass` to build the site, install it:
```
npm install -g yarn sass
```
Build the site:

```bash
cd tomox-sdk-ui
yarn install && yarn build
```

Your DEX UI is created into `./buid` directory. You can setup web server (nginx) and domain to publish your site to internet.

You can use `nginx` to serve the site.

## Setup web server (nginx)

TomoX-SDK backend run on port 8080 in the default. We can use Nginx to serve both TomoX-SDK and TomoX-SDK-UI and publish it to internet.

```
server {
    listen       80;
    server_name  _;

    root /path_to_your_tomox_sdk_ui_build;

    index index.html index.htm;

    # TomoX-SDK API
    location /api {
         proxy_set_header X-Real-IP $remote_addr;
         proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
         proxy_set_header Host $host;
         proxy_pass http://localhost:8080;
    }

    # TomoX-SDK socket
    location /socket {
        auth_basic off;
        proxy_set_header Host $host;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "Upgrade";
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_pass http://localhost:8080/socket;
    }

    # TomoX-SDK UI
    location / {
        try_files $uri $uri/ /index.html;
    }
}
```

After reloading `nginx` with the new configuration. You can access your DEX via `http://SERVER_IP`

