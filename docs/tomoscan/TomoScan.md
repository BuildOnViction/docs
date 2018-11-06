# TomoScan

TomoScan provides a block explorer with user friendly, detailed and professional user interface to the TomoChain ecosystem. 
TomoScan brings TomoChain’s transparency to users. 
All blocks, transactions, smart contracts, tokens and basically everything happening on the chain are shown to the users.
Furthermore, TomoScan also offers technical overview and expose useful metrics about the TomoChain. 

Here are the pages and features available on TomoScan:

## [Home](https://scan.testnet.tomochain.com/)
      
![TomoScan homepage](/assets/tomoscan_home.jpg)

This is the home page of TomoScan.
In the middle of the page you can find a search field that let you find anything by its address.
Under it, some general stats gives you the total amount of accounts, tokens, contracts and blocks.

## [Transactions](https://scan.devnet.tomochain.com/txs)
All the transactions pages list the following informations:
- The transaction's ID (Transaction Hash)
- The block containing this transaction
- The transaction's age
- The sender's address
- The recipient's address
- The transaction's ammount in TOMO
- The gas fees

### [All transactions](https://scan.devnet.tomochain.com/txs)
All the transactions that happenned on the chain.

### [Sign transactions](https://scan.devnet.tomochain.com/txs/signTxs)
Sign transactions emited by the masternodes.

### [Pending transactions](https://scan.devnet.tomochain.com/txs/pending)
Transactions that are not yet confirmed.

### [Other Transactions]()
All the transactions minus the sign and pending ones.

## [Transaction](https://scan.devnet.tomochain.com/txs/0x1185cbc8e3715d0e373be720e480bfad3f622a32734e3aec55607a5e10881750)
When consulting a single transaction, the page list the following informations:
- The transaction's ID (Transaction Hash).
- The transaction status.
- The block containing this transaction.
- The transaction's age.
- The sender's address.
- The recipient's address.
- The transaction's ammount in TOMO.
- The gas used.
- The gas price.
- The total gas cost.
- The transaction data.

## [Accounts](https://scan.testnet.tomochain.com/accounts)
List the accounts on the TomoChain.[TomoScan accounts](/assets/TomoScan_account.jpg)
 The Accounts part is divided in three parts : all accounts, all masternodes and verified contracts. Various informations can be found:
 
### [All accounts](https://scan.testnet.tomochain.com/accounts)
- The rank: it is based on the number of TOMO the account owns. The more TOMO the account has on his balance, the higher he will be.
- The adress of the account.
- The balance of TOMO.
- The number of transactions made on this account.

### [All masternodes](https://scan.testnet.tomochain.com/masternodes)
- The adress of a masternode.
- The name of a masternode.
- Who is the owner.
- The status, you can check if the masternode is still active.
- The latest signed block.

### [Verified Contracts](https://scan.testnet.tomochain.com/contracts)
Verified contracts are contracts that were verified by the author. You can find on this tab : 
- The adress of the contract.
- The ContractName
- The balance of TOMO
- The number of transactions.
- The date when the contract was verified.

## [Tokens](https://scan.testnet.tomochain.com/tokens)
The Tokens tab includes all the tokens that are using TomoChain and all the Token Transfers from an adress to another.

### [All Tokens](https://scan.testnet.tomochain.com/tokens)
The informations found are the following :
- The hash.
- The name of the token.
- The symbol.
- The number of decimals.
- The number of transactions.

### [Tokens transfers](https://scan.testnet.tomochain.com/tokentxs)
 This tab contains :
 - The TxHash of the transaction.
 - "Lastseen" as when the transaction occured.
 - "From" is the original adress.
 - "To" is the adress where the tokens are going.
 - Value is how much the transaction worth.
 - Token is the name of the token send in the transaction.

## [Blocks](https://scan.testnet.tomochain.com/blocks)

You can view here all the blocks that are on the TomoChain.

![TomoScan blocks](/assets/whole_block_TomoScan.jpg)

The informations available for each block are the following :
- Height: the block number.
- Age: How long ago the block was created.
- Txn: number of transactions in this block.
- Miner: the address of the masternode who created this block.
- GasUsed: the gas used to mine the block.
- Finality: The percentage of the network who validated this block. When it reach 75%, the block reach it's finality state and is added permanently to the chain.

If you click on a block, you will find more detailled informations such as :
- The height.
- The timeStamp.
- The transactions made on the block.
- The hash.
- The parent hash.
- The miner adress.
- The finality.
- The Gas Used on the block.
- The Gas Limit.
- Some extra Data.
- The Blocksigner, it is the Masternode that created the block.

![TomoScan block](/assets/whole_block_TomoScan.jpg)

## [Sign and Register]

If you register, you will be able to keep a watchlist of some addresses you are interested into.
You will receive an email notification when this address perform actions.

Please keep in mind that TomoScan is subject to go through some changes. 
That is why your feedback is appreciated!
