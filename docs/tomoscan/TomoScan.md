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
- The transaction's ID (Transaction Hash)
- The transaction status
- The block containing this transaction
- The transaction's age
- The sender's address
- The recipient's address
- The transaction's ammount in TOMO
- The gas used
- The gas price
- The total gas cost
- The transaction data

## Accounts
List the accounts on the TomoChain.[TomoScan accounts](/assets/TomoScan_account.jpg)

You can search for a specific account if you know his adress.
His rank is based on the number of TOMO the account owns. The more TOMO the account has on his balance, the higher he will be. 
The number of transactions made on this account is  shown on the right.
Verified Contracts are contracts that were verified by the author.

## Tokens
The Tokens tab includes all the tokens that are using TomoChain and all the Token Transfers from an adress to another.

## Blocks

You can view here all the blocks that are on the TomoChain.

![TomoScan blocks](/assets/whole_block_TomoScan.jpg)

The informations available for each block are the following :
- Height: the block number.
- Age: How long ago the block was created.
- Txn: number of transactions in this block.
- Miner: the address of the masternode who created this block.
- GasUsed: the gas used to mine the block.
- Finality: The percentage of the network who validated this block. When it reach 75%, the block reach it's finality state and is added permanently to the chain.

If you click on a block, you will find more detailled informations such as the transactions made on the block, who created the block and the Blocksigner. 
Blocksigner is the Masternode that created the block.

![TomoScan block](/assets/whole_block_TomoScan.jpg)

## Sign and Register

If you register, you will be able to keep a watchlist of some addresses you are interested into.
You will receive an email notification when this address perform actions.

Please keep in mind that TomoScan is subject to go through some changes. 
That is why your feedback is appreciated!
