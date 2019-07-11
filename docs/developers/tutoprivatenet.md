This tutorial shows how to setup a private TomoChain testnet on a local machine.
The purpose is to help developers familiarise TomoChain's source code and initial setup
so that one can learn to contribute to the development of TomoChain.
The tutorial is alo a first step for any developer who wants to customize TomoChain's 
source code to use in a private or consortium environment.

The following will walk you step-by-step to setup a TomoChain private net with three masternodes.

## Install Golang
  - Reference: https://golang.org/doc/install
  - Set environment variables
  
```
    set GOROOT=$HOME/usr/local/go
    
    set GOPATH=$HOME/go
```
    
## Prepare tomo client software
   - ```cd $GOPATH/src/github.com/ethereum/go-ethereum```
   - Download source code and build

```
    git init
    
    git remote add git@github.com:tomochain/tomochain.git
    
    git pull origin master
    
    make all
```

   - Create shortcuts/alias for easier access
   
```
    alias tomo=$GOPATH/src/github.com/ethereum/go-ethereum/build/bin/tomo

    alias bootnode=$GOPATH/src/github.com/ethereum/go-ethereum/build/bin/bootnode

    alias puppeth=$GOPATH/src/github.com/ethereum/go-ethereum/build/bin/puppeth
```   
        
## Setup chain data folders `datadir` and corresponding `keystore` folders for 3 masternodes
   
```
    mkdir $HOME/tomochain

    mkdir $HOME/tomochain/nodes

    mkdir $HOME/tomochain/nodes/1 $HOME/tomochain/nodes/2 $HOME/tomochain/nodes/3 

    mkdir $HOME/tomochain/keystore/1 $HOME/tomochain/keystore/2 $HOME/tomochain/keystore/3
```

## Initialize / Import accounts for the masternodes's keystore 
   - Initialize new accounts: If you have existing accounts and prefer importing them, please ignore this step and go to `Import Accounts`
   
```
    tomo account new \
    
      --password [YOUR_PASSWORD_FILE_TO_LOCK_YOUR_ACCOUNT] \
    
      --keystore $HOME/tomochain/keystore/1

```

```
    tomo account new \
    
      --password [YOUR_PASSWORD_FILE_TO_LOCK_YOUR_ACCOUNT] \
    
      --keystore $HOME/tomochain/keystore/2
```

```
    tomo account new \
    
      --password [YOUR_PASSWORD_FILE_TO_LOCK_YOUR_ACCOUNT] \
    
      --keystore $HOME/tomochain/keystore/3
      
```

   - Import accounts
   
```
    tomo  account import [PRIVATE_KEY_FILE_OF_YOUR_ACCOUNT] \

    --keystore $HOME/tomochain/keystore/1 \

    --password [YOUR_PASSWORD_FILE_TO_LOCK_YOUR_ACCOUNT]
```

   Repeat this step to import two more private keys for our three masternodes.
    
## Customize genesis block by using the `puppeth` tool
   - Run puppeth command and answer questions about your private chain as follows:
   
```
   puppeth
```

   - Set chain name
```
     > localtomo
```
   ![Private chain name](https://user-images.githubusercontent.com/17243442/57121919-bcbbd000-6da4-11e9-8a0e-dea3a15f3fc1.png)
   
   - Enter 2 to configure new genesis
   - Enter 3 to select `POSV` consensus
   - Set blocktime (default 2 seconds)
   - Set reward of each epoch
   - Set addresses to be initial masternodes
   - Set number of blocks of each epoch (default 900). If you would like to customize epoch number, please update code here
   `common/constants.go:14`
   ```
        EpocBlockRandomize         = 900
   ```
   
   - Set gap (How many blocks before checkpoint need prepare new masternodes set ?)
   `suggestedGap = 5`
   - Enter foundation address which you hold private key
   
   ![POSV configurations](https://user-images.githubusercontent.com/17243442/57122012-2f2cb000-6da5-11e9-8b1e-7fc1c034226a.png)
   
   - Enter accounts which you control private keys to unlock MultiSig wallet
   
   ![MultiSig wallet setting](https://user-images.githubusercontent.com/17243442/57122031-453a7080-6da5-11e9-92d6-49fba3a4c1ea.png)
   
   - Enter swap wallet address for fund 55 million TOMO
   
   ![Initial funds](https://user-images.githubusercontent.com/17243442/57122062-7024c480-6da5-11e9-98f1-4ce90b2941d6.png)
   
   - Export genesis file
        - Select `2. Manage existing genesis`
        - Select `2. Export genesis configuration`
        - Enter genesis filename
         
   ![Export genesis file](https://user-images.githubusercontent.com/17243442/57122075-82066780-6da5-11e9-89b2-e0369ec528f5.png)

   - `Control + C` to exit

## Initialize your private chain with above genesis block

```
    tomo --datadir $HOME/tomochain/nodes/1 init [PATH/TO/GENESIS_FILE]

    tomo --datadir $HOME/tomochain/nodes/2 init [PATH/TO/GENESIS_FILE]

    tomo --datadir $HOME/tomochain/nodes/3 init [PATH/TO/GENESIS_FILE]
```
    
## Setup bootnode
   - Initialize bootnode key
   
```
    bootnode -genkey bootnode.key
```

   - Start bootnode and copy bootnode information
   
```
    bootnode -nodekey ./bootnode.key
```

`enode://7e59324b1e54f8c282719465eb96786fb3a04a0265deee2cdb0f62e912337ca6f118d0c91f7ebfae6f5c17825205279249cf7ff65ae54d0a1a8908ef16f80f63@[::]:30301`
  ![Start bootnode](https://user-images.githubusercontent.com/17243442/57963757-9b85e280-7953-11e9-87ab-021a3cf5d8f8.png)

## Start masternodes
   - Start masternode 1
   
```
    tomo  --syncmode "full" \
        
        --datadir $HOME/tomochain/nodes/1 --networkid [YOUR_NETWORK_ID] --port 10303 \
        
        --keystore $HOME/tomochain/keystore/1 --password [YOUR_PASSWORD_FILE_TO_UNLOCK_YOUR_ACCOUNT] \
        
        --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --rpcport 1545 --rpcvhosts "*" \
        
        --rpcapi "db,eth,net,web3,personal,debug" \
        
        --gcmode "archive" \
        
        --ws --wsaddr 0.0.0.0 --wsport 1546 --wsorigins "*" --unlock "[ADDRESS_MASTERNODE_1]" \
        
        --identity "NODE1" \
        
        --mine --gasprice 2500 \
        
        --bootnodes [YOUR_BOOTNODE_INFORMATION] \
        
        console
```
   - Start masternode 2
   
```
        tomo  --syncmode "full" \
            
            --datadir $HOME/tomochain/nodes/2 --networkid [YOUR_NETWORK_ID] --port 20303 \
            
            --keystore $HOME/tomochain/keystore/2 --password [YOUR_PASSWORD_FILE_TO_UNLOCK_YOUR_ACCOUNT] \
            
            --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --rpcport 2545 --rpcvhosts "*" \
            
            --rpcapi "db,eth,net,web3,personal,debug" \
            
            --gcmode "archive" \
            
            --ws --wsaddr 0.0.0.0 --wsport 2546 --wsorigins "*" --unlock "[ADDRESS_MASTERNODE_2]" \
            
            --identity "NODE2" \
            
            --mine --gasprice 2500 \
            
            --bootnodes [YOUR_BOOTNODE_INFORMATION] \
            
            console
```

   - Start masternode 3
```
        tomo  --syncmode "full" \

            --datadir $HOME/tomochain/nodes/3 --networkid [YOUR_NETWORK_ID] --port 30303 \

            --keystore $HOME/tomochain/keystore/3 --password [YOUR_PASSWORD_FILE_TO_UNLOCK_YOUR_ACCOUNT] \

            --rpc --rpccorsdomain "*" --rpcaddr 0.0.0.0 --rpcport 3545 --rpcvhosts "*" \

            --rpcapi "db,eth,net,web3,personal,debug" \

            --gcmode "archive" \

            --ws --wsaddr 0.0.0.0 --wsport 3546 --wsorigins "*" --unlock "[ADDRESS_MASTERNODE_3]" \

            --identity "NODE3" \

            --mine --gasprice 2500 \

            --bootnodes [YOUR_BOOTNODE_INFORMATION] \

            console
```

   - Some explanations on the flags
   
```
           --verbosity: log level from 1 to 5. Here we're using 4 for debug messages
           
           --datadir: path to your data directory created above.
           
           --keystore: path to your account's keystore created above.
           
           --identity: your full-node's name.
           
           --password: your account's password.
           
           --networkid: our testnet network ID.
           
           --port: your full-node's listening port (default to 30303)
           
           --rpc, --rpccorsdomain, --rpcaddr, --rpcport, --rpcvhosts: your full-node will accept RPC requests at 8545 TCP.
           
           --ws, --wsaddr, --wsport, --wsorigins: your full-node will accept Websocket requests at 8546 TCP.
           
           --mine: your full-node wants to register to be a candidate for masternode selection.
           
           --gasprice: Minimal gas price to accept for mining a transaction.
           
           --targetgaslimit: Target gas limit sets the artificial target gas floor for the blocks to mine (default: 4712388)
           
           --bootnode: bootnode information to help to discover other nodes in the network
           
           --gcmode: blockchain garbage collection mode ("full", "archive")
           
           --synmode: blockchain sync mode ("fast", "full", or "light". More detail: https://github.com/tomochain/tomochain/blob/master/eth/downloader/modes.go#L24)
```
   To see all flags usage
   
```
      tomo --help
```


## Check your private chain
  - Connect ipc
   
```
    tomo attach $HOME/tomochain/nodes/1/tomo.ipc
```
   
```
    admin.nodeInfo

    eth.getBlock(0)

    eth.getBlock(1)
```

   - Connect rpc

```
    tomo attach tomo attach http://0.0.0.0:1545
```

```
    eth.getBlock(0)

    eth.getBlock(1)
```
 
   - Verify Checkpoints
    
        Wait about 30 minutes to see if your chain passes the first checkpoint
   ![Console log at checkpoint](https://user-images.githubusercontent.com/17243442/57122084-93e80a80-6da5-11e9-81cf-598693bd2779.png)

```
    tomo attach http://0.0.0.0:1545
```

```
    eth.getBlock(900)
```

## Troubleshooting
   - Reset your chain
   
```
    rm -rf $HOME/tomochain/nodes/1/tomo $HOME/tomochain/nodes/2/tomo  $HOME/tomochain/nodes/3/tomo

    tomo --datadir $HOME/tomochain/nodes/1 init genesis.json

    tomo --datadir $HOME/tomochain/nodes/2 init genesis.json

    tomo --datadir $HOME/tomochain/nodes/3 init genesis.json
```
