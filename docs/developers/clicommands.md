This shows useful CLI commands for developers to work with the TomoChain client `tomo`.

Command:
`$ tomo [OPTIONS]`

**Options:**

- `--verbosity`: log level from 1 to 5. Here we're using 4 for debug messages
- `--datadir`: path to your data directory created above.
- `--keystore`: path to your account's keystore created above.
- `--identity`: your full-node's name.
- `--password`: your account's password.
- `--networkid`: our network ID.
- `--port`: your full-node's listening port (default to 30303)
- `--rpc, --rpccorsdomain, --rpcaddr, --rpcport, --rpcvhosts`: your full-node will accept RPC requests at 8545 TCP.
- `--ws, --wsaddr, --wsport, --wsorigins`: your full-node will accept Websocket requests at 8546 TCP.
- `--mine`: [required] your full-node wants to register to be a candidate for masternode selection.
- `--gasprice`: Minimal gas price to accept for mining a transaction.
- `--targetgaslimit`: Target gas limit sets the artificial target gas floor for the blocks to mine (default: 4712388)
- `--bootnode`: bootnode information to help to discover other nodes in the network
- `--gcmode`: blockchain garbage collection mode ("full", "archive")
- `--synmode`: [required] blockchain sync mode ("full". More detail: https://github.com/tomochain/tomochain/blob/master/eth/downloader/modes.go#L24)
- `--ethstats`: send data to stats website
- `--tomo-testnet`: required when the networkid is testnet(89)
- `--store-reward`: store reward report
