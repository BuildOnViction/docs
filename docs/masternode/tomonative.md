This guide shows how to run a TomoChain masternode in testnet and 
mainnet without the need of using Docker and `tmn`.


## Install Golang
- Reference: https://golang.org/doc/install
- Set environment variables
  
```bash
export GOROOT=$HOME/usr/local/go

export GOPATH=$HOME/go
```
    
## Prepare tomo client software
#### Build from source code
```bash
cd $GOPATH/src/github.com/ethereum/go-ethereum
```
- Download source code and build

```bash
git init

git remote add git@github.com:tomochain/tomochain.git

git pull origin master

make all
```
- Binary file should be generated in build folder `$GOPATH/src/github.com/ethereum/go-ethereum/build/bin`

```bash
alias tomo=$GOPATH/src/github.com/ethereum/go-ethereum/build/bin/tomo
```

#### Use binary
- Download tomo binary from our [releases page](https://github.com/tomochain/tomochain/releases)

```bash
alias tomo=path/to/tomo/binary
```

## Download genesis block
$GENESIS_PATH : location of genesis file you would like to put
```bash
export GENESIS_PATH=path/to/genesis.json
```
- Testnet
```bash
    curl -L https://raw.githubusercontent.com/tomochain/tomochain/master/genesis/testnet.json -o $GENESIS_PATH
```

- Mainnet
```bash
curl -L https://raw.githubusercontent.com/tomochain/tomochain/master/genesis/mainnet.json -o $GENESIS_PATH
```

## Create datadir
- create a folder to store tomochain data on your machine

```
export DATA_DIR=/path/to/your/data/folder
mkdir -p $DATA_DIR/tomo
```
## Initialize the chain from genesis

```bash
tomo init $GENESIS_PATH --datadir $DATA_DIR
```

## Initialize / Import accounts for the nodes's keystore
If you already had an existing account, import it. Otherwise, please initialize new accounts 

```bash
export KEYSTORE_DIR=path/to/keystore
```

#### Initialize new accounts
```
tomo account new \
    --password [YOUR_PASSWORD_FILE_TO_LOCK_YOUR_ACCOUNT] \
    --keystore $KEYSTORE_DIR
```
    
#### Import accounts

```bash
    tomo  account import [PRIVATE_KEY_FILE_OF_YOUR_ACCOUNT] \    
        --keystore $KEYSTORE_DIR \
        --password [YOUR_PASSWORD_FILE_TO_LOCK_YOUR_ACCOUNT]
```

#### List all available accounts in keystore folder

```bash
    tomo account list --datadir ./  --keystore $KEYSTORE_DIR
```

## Start a node
#### Environment variables
- $IDENTITY: the name of your node
- $PASSWORD: the password file to unlock your account
- $YOUR_COINBASE_ADDRESS: address of your account which generated in the previous step
- $NETWORK_ID: the networkId. Mainnet: 88. Testnet: 89
- $BOOTNODES: The comma separated list of bootnodes. Find them [here](https://docs.tomochain.com/general/networks/)
- $WS_SECRET: The password to send data to the stats website. Find them [here](https://docs.tomochain.com/general/networks/)
- $NETSTATS_HOST: The stats website to report to, regarding to your environment. Find them [here](https://docs.tomochain.com/general/networks/)
- $NETSTATS_PORT: The port used by the stats website (usually 443)
    
#### Let's start a node
```bash
tomo  --syncmode "full" \
    
    --datadir $DATA_DIR --networkid $NETWORK_ID --port 30303 \
    
    --keystore $KEYSTORE_DIR --password $PASSWORD \
    
    --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --rpcport 8545 --rpcvhosts "*" \
    
    --rpcapi "db,eth,net,web3,personal,debug" \
    
    --gcmode "archive" \
    
    --ws --wsaddr 0.0.0.0 --wsport 8546 --wsorigins "*" --unlock "$YOUR_COINBASE_ADDRESS" \
    
    --identity $IDENTITY \
    
    --mine --gasprice 2500 \
    
    --bootnodes $BOOTNODES \
    
    --ethstats $IDENTITY:$WS_SECRET@$NETSTATS_HOST:$NETSTATS_PORT
    
    console
```


#### Some explanations on the flags
   
```
--verbosity: log level from 1 to 5. Here we're using 4 for debug messages
           
--datadir: path to your data directory created above.
           
--keystore: path to your account's keystore created above.
           
--identity: your full-node's name.
           
--password: your account's password.
           
--networkid: our network ID.
           
--port: your full-node's listening port (default to 30303)
           
--rpc, --rpccorsdomain, --rpcaddr, --rpcport, --rpcvhosts: your full-node will accept RPC requests at 8545 TCP.
           
--ws, --wsaddr, --wsport, --wsorigins: your full-node will accept Websocket requests at 8546 TCP.
           
--mine: your full-node wants to register to be a candidate for masternode selection.
           
--gasprice: Minimal gas price to accept for mining a transaction.
           
--targetgaslimit: Target gas limit sets the artificial target gas floor for the blocks to mine (default: 4712388)
           
--bootnode: bootnode information to help to discover other nodes in the network
           
--gcmode: blockchain garbage collection mode ("full", "archive")
           
--synmode: blockchain sync mode ("fast", "full", or "light". More detail: https://github.com/tomochain/tomochain/blob/master/eth/downloader/modes.go#L24)
           
--ethstats: send data to stats website

--tomo-testnet: required when the networkid is testnet(89)
```
To see all flags usage
   
```bash
tomo --help
```

## See your node on stats page
- Testnet: https://stats.testnet.tomochain.com
- Mainnet: http://stats.tomochain.com
