# CaelumScan

CaelumScan provides a block explorer to the Caelum ecosystem with user friendly, detailed and professional user interface.
CaelumScan brings Caelum's transparency to users.
All blocks, transactions, smart contracts, tokens and basically everything happening on the chain are shown to the users.
Furthermore, CaelumScan also offers technical overview and expose useful metrics about the Caelum.

## [Home](https://scan.caelumfoundation.com/)

![CaelumScan homepage](/assets/tomoscan1.jpg)

This is the home page of CaelumScan.
In the middle of the page you can find a search field that let you find anything by its address.
Under it, some general stats gives you the total amount of accounts, tokens, contracts and blocks.

## [Transactions](https://scan.caelumfoundation.com/txs)

![CaelumScan transactions](/assets/tomoscan2.jpg)

All the transactions pages list the following informations:
- The transaction's ID (Transaction Hash).
- The block containing this transaction.
- The transaction's age.
- The sender's address.
- The recipient's address.
- The transaction's ammount in CLMP.
- The gas fees.

### [All transactions](https://scan.caelumfoundation.com/txs)
All the transactions that happened on the chain.

### [Sign transactions](https://scan.caelumfoundation.com/txs/signTxs)
Sign transactions emited by the masternodes.

### [Pending transactions](https://scan.caelumfoundation.com/txs/pending)
Transactions that are not yet confirmed.

### [Other Transactions]()
All the transactions minus the sign and pending ones.

## [Transaction](https://scan.caelumfoundation.com/txs/0xf15f3cfd9d298cb52df881a4d48d0a99b4b2ecbf7268255a2eb4792d5d75ad0f)
When consulting a single transaction, the page list the following informations:
- The transaction's ID (Transaction Hash).
- The transaction status.
- The transaction containing block.
- The transaction age.
- The transaction sender address.
- The transaction recipient address.
- The transaction ammount in CLMP.
- The transaction gas used.
- The transaction gas price.
- The transaction total gas cost.
- The transaction data.

## [Accounts](https://scan.caelumfoundation.com/accounts)

![CaelumScan accounts](/assets/tomoscan3.jpg)

List the accounts on Caelum.

### [All accounts](https://scan.caelumfoundation.com/accounts)
All the accounts that exist on the chain.
The page list the following informations:
- The account rank (ordered by balance).
- The account address.
- The account balance in CLMP.
- The account transactions count.

### [All masternodes](https://scan.caelumfoundation.com/masternodes)
All the masternode accounts that exist on the chain.
The page list these informations:
- The account address.
- The account linked to the masternode name.
- The account linked to the masternode owner.
- The account linked to the masternode status.
- The account linked to the masternode latest signed block.

### [Verified Contracts](https://scan.caelumfoundation.com/contracts)
All the verified contracts that exist on the chain.
A contracts has to be manually verified by it's owner to appear here.
The page list the following informations:
- The account address.
- The account contract name.
- The account balance in CLMP.
- The account transactions count.
- The account contract verification date.

## [Account](https://scan.caelumfoundation.com/address/0x48Aa20c9135a10544c57F4de7a80A6209152b98D)
When clicking on an account, the following informations are displayed:
- The account balance in CLMP.
- The CLMP USD Value.
- The account transactions count.
- The transactions of this account.
- The mined blocks.
- The events of this account.
- The rewards of the account for each epoch.

## [Tokens](https://scan.caelumfoundation.com/tokens)

![CaelumScan tokens](/assets/tomoscan4.jpg)

List the tokens on Caelum and their transfers.

### [All Tokens](https://scan.caelumfoundation.com/tokens)
All the tokens on the chain.
The page list the following informations:
- The token address (hash).
- The token name.
- The token symbol.
- The token total supply.
- The token decimals.
- The token transactions count.

### [Tokens transfers](https://scan.caelumfoundation.com/tokentxs)
All the tokens transfers on the chain.
The page list the following informations:
- The transaction hash.
- The transaction age.
- The transaction sender address.
- The transaction recipient address.
- The transaction value in token.
- The token name.

### [Token](https://scan.caelumfoundation.com/tokens/0x8602ce2124f9b05dc6654230079dd31250292bd5)

When clicking on an token, the following informations are displayed:
- The token name.
- The number of token holders.
- The number of transfers made with the token.
- The link of the official site, please keep in mind that CaelumScan is constantly updating.
  Some links might be  missing.
- The official contract adress.
- Number of decimal.
- Useful links.
- "Filtered by": use it if you want to see a the transactions of an adress in particular.
  In this example, you can check all the transactions made of the BigBom tokens from an adress to another.

## [Blocks](https://scan.caelumfoundation.com/blocks)

![CaelumScan blocks](/assets/tomoscan5.jpg)

List all the blocks on Caelum.
The page list the following informations:
- The block height (index).
- The block age.
- The block number of transactions.
- The block creator.
- The block total gas used.
- The block finality.

!!! note "Finality"
    The percentage of the network who validated this block.
    When it reach 75%, the block reach it's finality state and is added permanently to the chain.

## [Block](https://scan.caelumfoundation.com/blocks/200000)

When consulting a single block, the page list the following informations:
- The block height (index).
- The block age.
- The block number of transactions.
- The block hash.
- The block parent hash.
- The block creator adress.
- The block finality.
- The block total gas used.
- The global pre block gas limit.
- The block extra data.

A tab "Transactions" contains the list of transactions in this block.
A tab "Signers" contains the list of masternode who signed this block.

## [Login and Register]()

If you register, you will be able to keep a watchlist of some addresses you are interested into.
You will receive an email notification when this address perform actions.

Please keep in mind that CaelumScan is subject to go through some changes.
This is why your feedback is so much appreciated!
