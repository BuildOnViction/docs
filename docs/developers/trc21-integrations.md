Smart Contract ABI: [TRC21.json](https://raw.githubusercontent.com/tomochain/trc21/master/TRC21.json)

TRC21 Contract Interface:
```javascript
function totalSupply() public view returns (uint);
function balanceOf(address tokenOwner) public view returns (uint balance);
function allowance(address tokenOwner, address spender) public view returns (uint remaining);
function transfer(address to, uint tokens) public returns (bool success);
function approve(address spender, uint tokens) public returns (bool success);
function transferFrom(address from, address to, uint tokens) public returns (bool success);

event Transfer(address indexed from, address indexed to, uint tokens);
event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
```

TomoChain provides RPC APIs. So you can use Web3 library to directly call the functions in the smart contract.

You can follow the steps below to interact with the smart contract by using Web3 library and NodeJS.

## Init Web3 provider
At the first step, you need init Web3 provider by connecting TomoChain Fullnode RPC endpoint

You can take a look to [TomoChain Networks](https://docs.tomochain.com/general/networks/) page to the details of Testnet/Mainnet network information.

```javascript
const Web3 = require('web3')
const web3 = new Web3('https://rpc.tomochain.com')
const chainId = 88
```

## Unlock wallet
You need to unlock the wallet before interact TRC21 contract
#### Example
```javascript
// Unlock wallet by private key
const account = web3.eth.accounts.privateKeyToAccount(pkey)
const holder = account.address
web3.eth.accounts.wallet.add(account)
web.eth.defaultAccount = holder
```

## Init Web3 TRC21 Contract

```javascript
const trc21Abi = require('./TRC21.json')
const address = '[enter_your_contract_address]'
const trc21 = new web3.eth.Contract(trc21Abi,
        address, {gasPrice: 250000000, gas: 2000000 })
```

Note: you can get TRC21.json [here](https://raw.githubusercontent.com/tomochain/trc21/master/TRC21.json)

## Check balance
You need to call function `balanceOf()` from TRC21 contract to check your token balance for an address.

#### Example
```javascript
// Token holder address
const address  = "0xf8ac9d5022853c5847ef75aea0104eed09e5f402"

trc21.methods.balanceOf(address).call()
.then((result) => {
    console.log(result)
}).catch(e => console.log(e))
```

## Transfer token
Token holder needs to call function `transfer` to send token to an address

#### Example
```javascript
// send 500000000000000000000 tokens to this address (e.g decimals 18)
const to = "0xf8ac9d5022853c5847ef75aea0104eed09e5f402"
trc21.methods.transfer(to, '500000000000000000000').send({
    from: holder,
    gas: 2000000,
    gasPrice: 250000000,
    chainId: chainId
})
.then((result) => {
    console.log(result)
}).catch(e => console.log(e))
```
