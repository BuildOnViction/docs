This tutorial shows how to setup a private TomoChain testnet on a local machine.
The purpose is to help developers familiarise TomoChain's source code and initial setup
so that one can learn to contribute to the development of TomoChain.
The tutorial is alo a first step for any developer who wants to customize TomoChain's 
source code to use in a private or consortium environment.

- Install Golang
    - Reference: https://golang.org/doc/install
    - Set environment variables
    ```
    set GOROOT=$HOME/usr/local/go
    set GOPATH=$HOME/go
    ```
    
- Prepare tomo client software
    - cd $GOPATH/src/github.com/ethereum/go-ethereum
    - Download source code and build
    ```
    git init
    git remote add git@github.com:tomochain/tomochain.git
    git pull origin master
    make all
    ```
    - Create shortcuts
    ```
    alias tomo=$GOPATH/src/github.com/ethereum/go-ethereum/build/bin/tomo
    alias bootnode=$GOPATH/src/github.com/ethereum/go-ethereum/build/bin/bootnode
    alias puppeth=$GOPATH/src/github.com/ethereum/go-ethereum/build/bin/puppeth
    ```   
        
- Setup datadir for 3 nodes
    ```
    mkdir $HOME/tomochain
    mkdir $HOME/tomochain/nodes
    mkdir $HOME/tomochain/nodes/1 $HOME/tomochain/nodes/2 $HOME/tomochain/nodes/3 
    mkdir $HOME/tomochain/keystore/1 $HOME/tomochain/keystore/2 $HOME/tomochain/keystore/3
    ```
- Init / Import accounts
    - Init new accounts. If you have existing accounts, please ignore this step and go to `Import Accounts`
    ```
    tomo account new \
      --password [YOUR_PASSWORD_FILE_TO_LOCK_YOUR_ACCOUNT] \
      --keystore $HOME/tomochain/keystore/1

    tomo account new \
      --password [YOUR_PASSWORD_FILE_TO_LOCK_YOUR_ACCOUNT] \
      --keystore $HOME/tomochain/keystore/2
      
    tomo account new \
      --password [YOUR_PASSWORD_FILE_TO_LOCK_YOUR_ACCOUNT] \
      --keystore $HOME/tomochain/keystore/3
      
      
    ```
    - Import accounts
    ```
    tomo  account import [PRIVATE_KEY_FILE_OF_YOUR_ACCOUNT] \
    --keystore $HOME/tomochain/keystore \
    --password [YOUR_PASSWORD_FILE_TO_LOCK_YOUR_ACCOUNT]
    ```
    
- Customize genesis block
    - Run puppeth command and answer questions about your private chain
    ```
    puppeth
    ```
    ![Private chain name](https://user-images.githubusercontent.com/17243442/57121919-bcbbd000-6da4-11e9-8a0e-dea3a15f3fc1.png)
    ![POSV configurations](https://user-images.githubusercontent.com/17243442/57122012-2f2cb000-6da5-11e9-8b1e-7fc1c034226a.png)
    ![MultiSig wallet setting](https://user-images.githubusercontent.com/17243442/57122031-453a7080-6da5-11e9-92d6-49fba3a4c1ea.png)
    ![Initial funds](https://user-images.githubusercontent.com/17243442/57122062-7024c480-6da5-11e9-98f1-4ce90b2941d6.png)
    ![Export genesis file](https://user-images.githubusercontent.com/17243442/57122075-82066780-6da5-11e9-89b2-e0369ec528f5.png)


    - `Control + C` to exit

- Init your private chain with above genesis block
    ```
    tomo --datadir $HOME/tomochain/nodes/1 init [PATH/TO/GENESIS_FILE]
    tomo --datadir $HOME/tomochain/nodes/2 init [PATH/TO/GENESIS_FILE]
    tomo --datadir $HOME/tomochain/nodes/3 init [PATH/TO/GENESIS_FILE]
    ```
    
- Setup bootnode
    - Init bootnode key
    ```
    echo ed5391645b54f2df01177c3975c7a9a0902e281b6b6dc0fa0a6999fb2ea0e147 > bootnode.key
    ```
    - Start bootnode
    ```
    bootnode -nodekey ./bootnode.key
    ```
    
- Start masternodes
    - Node1
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
        --bootnodes "enode://5f260dc416222d49c273ee2ab43b4d7f1f6e6ee8b7afef3504f5c9151d5bf3499f9ff598ad17caa58553568a51ddbc73340d03dba5304956126adc11ebd3dfd5@127.0.0.1:30301" \
        console
    ```
    - Node2
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
            --bootnodes "enode://5f260dc416222d49c273ee2ab43b4d7f1f6e6ee8b7afef3504f5c9151d5bf3499f9ff598ad17caa58553568a51ddbc73340d03dba5304956126adc11ebd3dfd5@127.0.0.1:30301" \
            console
     ```
    - Node 3
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
            --bootnodes "enode://5f260dc416222d49c273ee2ab43b4d7f1f6e6ee8b7afef3504f5c9151d5bf3499f9ff598ad17caa58553568a51ddbc73340d03dba5304956126adc11ebd3dfd5@127.0.0.1:30301" \
            console
    ```

- Do some checks with your private chain
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
    tomo attach tomo attach http://0.0.0.0:1545
    ```
    ```
    eth.getBlock(900)
    ```
- Troubleshooting
    - Reset your chain
    ```
    rm -rf $HOME/tomochain/nodes/1/tomo $HOME/tomochain/nodes/2/tomo  $HOME/tomochain/nodes/3/tomo
    tomo --datadir $HOME/tomochain/nodes/1 init genesis.json
    tomo --datadir $HOME/tomochain/nodes/2 init genesis.json
    tomo --datadir $HOME/tomochain/nodes/3 init genesis.json
    ```
