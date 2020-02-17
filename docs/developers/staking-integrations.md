Masternodes and stakers is stored and governared in [TomoChain Validator smart contract](https://scan.tomochain.com/address/0x0000000000000000000000000000000000000088):

- Smart Contract Code: [TomoChain Validator](https://github.com/tomochain/tomomaster/blob/master/contracts/TomoValidator.sol)
- Smart Contract ABI: [TomoValidatorAbi.json](https://raw.githubusercontent.com/tomochain/tomomaster/master/abis/TomoValidatorAbi.json)

TomoChain Validator Smart Contract Interface:
```javascript
// apply a new masternode candidate
function propose(address _candidate) external payable;

// Deposit to stake/vote for a candidate
function vote(address _candidate) external payable;

// Unstake/unvote for a candidate
function unvote(address _candidate, uint256 _cap) public;

// Resign a candidate
function resign(address _candidate) public;

// Withdraw after unvote, resign
function withdraw(uint256 _blockNumber, uint _index) public;

function getCandidates() public view returns(address[]);

function getCandidateCap(address _candidate) public view returns(uint256);

function getCandidateOwner(address _candidate) public view returns(address);

function getVoterCap(address _candidate, address _voter) public view returns(uint256);

function getVoters(address _candidate) public view returns(address[]);

function isCandidate(address _candidate) public view returns(bool);

function getWithdrawBlockNumbers() public view returns(uint256[]);

function getWithdrawCap(uint256 _blockNumber) public view returns(uint256);

```

TomoChain provides RPC APIs. So you can use Web3 library to directly call the functions in the smart contract.

You can follow the steps below to interact with the smart contract by using Web3 library and NodeJS.

## Init Web3 provider
At the first step, you need init Web3 provider by connecting TomoChain Fullnode RPC endpoint.

```javascript
const Web3 = require('web3')
const web3 = new Web3('https://rpc.tomochain.com')
const chainId = 88
```

For testnet/mainnet details, you can get network information [here](https://docs.tomochain.com/general/networks/)
## Unlock wallet
You need to unlock the wallet before staking for the nodes
#### Example
```javascript
// Unlock wallet by private key
const account = web3.eth.accounts.privateKeyToAccount(pkey)
const owner = account.address
web3.eth.accounts.wallet.add(account)
web3.eth.defaultAccount = owner
```

## Init Web3 TomoChain Validator Contract

```javascript
const validatorAbi = require('./TomoValidatorAbi.json')
const address = '0x0000000000000000000000000000000000000088'
const validator = new web3.eth.Contract(validatorAbi,
        address, {gasPrice: 250000000, gas: 2000000 })
```

Note: you can get TomoValidatorAbi.json [here](https://raw.githubusercontent.com/tomochain/tomomaster/master/abis/TomoValidatorAbi.json)

## Propose/Apply a candidate
Masternode owner need to have at least 50000 TOMO to apply a fullnode to become a Masternode candidate. So make sure you have > 50000 TOMO in your masternode owner wallet to deposit to the smart contract and pay transaction fee.

You can apply a masternode candidate by call `propose` function from the smart contract

#### Example
```javascript
// Masternode coinbase address
const coinbase = "0xf8ac9d5022853c5847ef75aea0104eed09e5f402"

validator.methods.propose(coinbase).send({
    from : owner,
    value: '50000000000000000000000', // 50000 TOMO
    gas: 2000000,
    gasPrice: 250000000,
    chainId: chainId
})
.then((result) => {
    console.log(result)
}).catch(e => console.log(e))
```

You can refer to [Staking TomoChain script](https://gist.github.com/thanhson1085/7a6471ea0d6c0d6321a0454789d6266c)
## Stake/Vote a candidate
You can stake at least 100 TOMO for a node by calling `vote` function from the smart contract.

#### Example
Stake 500 TOMO to a node.
```javascript
validator.methods.vote(coinbase).send({
    from: owner,
    value: '500000000000000000000', // 500 TOMO
    gas: 2000000,
    gasPrice: 250000000,
    chainId: chainId
})
.then((result) => {
    console.log(result)
}).catch(e => console.log(e))
```

## Unstake/Unvote a candidate
You can unstake by calling `unvote` function from the smart contract

```javascript
const cap = '500000000000000000000' // unvote 500 TOMO

validator.methods.unvote(coinbase, cap).send({
    from : owner,
    gas: 2000000,
    gasPrice: 250000000,
    chainId: chainId
})
.then((result) => {
    console.log(result)
}).catch(e => console.log(e))
```

## Resign a candidate

```javascript
validator.methods.resign(coinbase).send({
    from : owner,
    gas: 2000000,
    gasPrice: 250000000,
    chainId: chainId
})
.then((result) => {
    console.log(result)
}).catch(e => console.log(e))
```

## Withdraw TOMO
You need to wait for 48 epochs (if unvote), 30 days (if resign) to unlock your TOMO staked

#### Example
```javascript
// get highest block number
web3.eth.getBlockNumber().then(blockNumber => {
    return validator.methods.getWithdrawBlockNumbers().call({
        from: owner
    }).then((result) => {
        let map = result.map(it, idx => {
            it = it.toString()
            if (parseInt(it) < blockNumber && it != "0") {
                return validator.methods.withdraw(it, idx).send({
                    from : owner,
                    gas: 2000000,
                    gasPrice: 250000000,
                    chainId: chainId
                })
            }
        })
        return Promise.all(map)
    })
}).then((result) => {
    console.log(result)
}).catch(e => console.log(e))
```

## Get list Withdrawals
We need to call `getWithdrawBlockNumbers` and `getWithdrawCap` function from TomoValidator smart contract to get the data

### Example
```
let blks = await contract.getWithdrawBlockNumbers.call({ from: owner })
// remove duplicate
blks = [...new Set(blks)]
let withdraws = []

await Promise.all(blks.map(async (it, index) => {
    let blk = new BigNumber(it).toString()
    if (blk !== '0') {
        self.aw = true
    }
    let wd = {
        blockNumber: blk
    }
    wd.cap = await contract.methods.getWithdrawCap(blk).call({ from: owner })
    withdraws[index] = wd
}))
console.log(withdraws)
```

## Get list candidates
You can get list candidates from [RPC endpoint](https://apidocs.tomochain.com/?shell#eth_getcandidates):
```
curl https://rpc.tomochain.com \
    -X POST \
    -H "Content-Type: application/json" \
    -d '{"jsonrpc":"2.0","method":"eth_getCandidates","params": ["latest"],"id":1}'

```
Or [get list candidates from TomoMaster](https://apidocs.tomochain.com/?shell#tomomaster-apis-candidates):
```
curl -X GET https://master.tomochain.com/api/candidates \
  -H 'Accept: application/json'
```

