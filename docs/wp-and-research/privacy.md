# TomoP - High Performance and Anonymous Transfer Protocol on TomoChain

Tremendous amount of work and investment has been devoted to the development of blockchain technology to solve current 
problems, i.e. scalability and privacy, with the technology itself as well as to 
maximize the adoption of the technology in daily life. 

The majority of public blockchain technology/platforms have a built-in cryptocurrency 
in which every transaction shows the amount of tokens or native coins 
that the sender is transferring to the recipient. 
In this regard, blockchain provides transparency to all users, 
which is not always expected by the majority of businesses. A business would 
like to hide the transaction amount, instead of showing to everyone.

This paper presents TomoP - a protocol proposed by TomoChain for private transactions on the TomoChain public blockchain.
The paper describes a protocol that allows to create anonymous transactions that hide 
the transaction value, sender, and receiver to 
preserve the financial privacy of holders of TOMO and tokens on TomoChain.
TomoP is the first ever EVM-compatible private transaction protocol with very fast transaction speed 
that allows to anonymize the transaction sender
in a transaction without requiring an intermediary.

TomoP solves the following problems:

* Performance: Most (if not all) current privacy `coins`, i.e. Monero, ZCoin, ZCash, are slow
because of high block time in the consensus protocol of those public chains. TomoP operates as
a DApp on TomoChain, which provides transaction confirmation within 2-4 seconds.

* Transaction sender anonymity: most EVM smart contract-based private transactions require a 
[relayer](https://ethresear.ch/t/burn-relay-registry-decentralized-transaction-abstraction-on-layer-2/5820)
to sign a private transaction to pay the transaction gas that will eventually be refunded.
This makes the privacy transaction system semi-decentralized. 
TomoP, on the other hand, uses TomoZ - the protocol to make gasless transactions without
requiring a `relayer` between the transaction creator and the blockchain.

* Out-of-gas: Verifying cryptographic proofs in private transactions requires intensive computation, which 
could cause the out-of-gas problem in EVM environment. 
To reduce gas consumption and speed up transaction proof verification, TomoP implements a set of 
precompiled contracts integrated in the core EVM of TomoChain. 

* TomoP allows to create a private token standard to 
make super fast token-based payment systems and DApps on TomoChain. 

TomoP relies on the following techniques:

* Cryptographic privacy building blocks include:
    * Stealth address: This technique is used for obfuscating transaction recipients by generating a new one-time public key
    for every transaction recipient so that there is no way for a third party to find the relationships
    between 2 different transaction recipients. What this means is that, if `Alice` is sending 2 transactions to
    `Bob`, no one, except `Alice` and `Bob` could find out the fact that `Bob` is the recipient in both transactions.
    * Ring Signature and Ring Confidential Transaction (RingCT): These are techniques used Monero for obfuscating
    transaction senders and transaction amounts in a transaction. 
    * Bulletproofs: Zero-knowledge proofs that allow to prove an encrypted number is within a range
    without revealing the number itself. 
    Bulletproofs are used in TomoP transactions to prove that a transaction amount in a private transaction
    is positive in order to prevent from double spending.

* TomoZ: TomoZ is the first decentralized gasless transaction protocol on TomoChain. 
TomoP relies on TomoZ to create a transaction fee vault for private transactions.
This fee vault is stored in [TomoIssuer](http://issuer.tomochain.com/) contract on TomoChain to
pay the network fee while the actual private transaction fee is paid internally in the private transaction.

* Precompiled contracts: A set of precompiled contracts for Ring Signature verification and Bulletproof range proof
is integrated directly into the core EVM of TomoChain. 
This allows any smart contract (i.e. private token contract) to call those precompiled contracts to verify cryptographic proofs.

## Why privacy matters?

Privacy is necessary for ensuring freedom on the internet. 
When your transactions are being watched — or 
when your transaction history is available to be known — 
a person isn't free to make their own decisions. 
With other digital currencies, bad actors are able to match 
people to their balances and details about parties involved, amounts and trends.

## Background

Blockchain technology fundamentally relies on distributed system principles and 
cryptography techniques, especially digital signature algorithms. 
Elliptic Curve Digital Signature Algorithm (ECDSA) is widely used in 
most blockchain systems such as Bitcoin, Ethereum, and TomoChain to 
generate a signature in order to authenticate the sender of a transaction. 
The most widely used elliptic curve in blockchains is secp256k1. 

The 64-character string called private key is the most important 
information that any holder should keep private. 
A private key can be used for generating a public key, which is in turn used 
for deriving an Ethereum user address (40 hex characters) that every cryptocurrency 
holder is familiar with.

Mathematically, an address X can be generated from a private key P as follows:

```
Pk = P*G
X = bytes20(SHA256(Pk))
```

Where `Pk` denotes the public key derived from the private key, 
`SHA256` is the cryptographic hash, `bytes20` takes the first 20 bytes of any data, 
and `G` is a common generator point in secp256k1 curve. 
Eventually, `X` is a 40-character string (20 bytes) derived from the private key.

The multiplication `P*G` is called elliptic multiplication. 
It is easy to compute a public key from a private key but it is 
infeasible to compute a private key from a given public key 
(there is no division in the elliptic curve number space).

### Pederson commitment

Pederson commitment is cryptographic commitment scheme equivalent to 
secretly writing a secret message m in a sealed, tamper-evident, 
individually numbered (or/and countersigned) envelope kept by who wrote the message. 
The envelope's content can't be changed by any means, and the message does not 
leak any information.

In TomoP, a Pederson commitment C to a number `f` is defined as follows:

```C = m*G + f*H```

Where `m` is 256-bit number called blinding factor/mask, and `H` is another generator point. 

If we consider f as an account’s balance on TomoChain, the commitment C can be used 
for hiding the transaction amount of such account. 
In other words, `C` is the Pederson encrypted amount of such account.

Pederson commitment is a form of additively homomorphic encryption, 
which has the following nice property: The sum of two Pederson commitments to f1 and f2 is equal to the Pederson commitment of f1 + f2.
			
			`C(m1, f1) + C(m2, f2) = C(m1 + m2, f1 + f2)`

This is the key application of Pederson commitment to most privacy-focused blockchains.

## TomoP architecture
TomoP supports both an anonymous TOMO transfer method and a private token standard on TomoChain.

The following figure shows the overview of TomoP that is integrated both at the core and the smart contract
layer of TomoChain.

![overviewprivacy](/assets/overviewprivacy.png){#fig:overviewprivacy}*Figure 1: Overview of TomoP*


Instead of directly sending funds to the recipient, the sender will anonymize their TOMO by making a 
transaction to the `Privacy` smart contract. 
As long as send transactions are made to the privacy contract, 
the latter allows TOMO holders to send/receiver TOMO to/from others 
without showing the transaction amount within it. 
TomoP transactions are like Monero transactions but in a smart contract on the very fast blockchain TomoChain.

Typically, funds flow as follows:

* A user anonymize her TOMO by making a deposit transaction to send TOMO to the 
privacy smart contract. 
This transaction is a normal transaction and does not hide the transaction amount.
This transaction creates a `Note` in the privacy contract. 
A note is similar to the concept of Unspent Transaction
Output (UTXO) on Bitcoin blockchain with additional information, i.e. a pedersen commitment, that is used
for creating cryptographic proofs when the user wants to make an anonymous send transaction.

* The user makes anonymous send transactions from the user to a recipient. 
The transaction amount is hidden. 
Funds are not moved out of the privacy contract. 
The user uses her own private key to create RingCT and Bulletproofs for 
the privacy contract to verify. 
Anonymous send obfuscates transaction sender and receive, and hides transaction amounts.

* The user can decide to de-anonymize her private TOMO by withdrawing all or part of his funds from the 
privacy contract to the user’s public wallet. 
The withdrawing amount is visible on the chain but the remaining funds 
of the user held in the privacy contract is always hidden.
 
### Transaction fee and TomoZ integration

TomoP utilizes TomoZ - the core protocol of TomoChain allowing gasless transactions in a 
decentralized way to anonymize `msg.sender` in anonymous send transactions to the privacy smart contract.
TomoZ integration is very important to TomoP because of the way that it does not require an account to 
hold TOMO to make a transaction.

For example, when `Alice` wants to make an anonymous send transaction to the privacy contract, if `Alice` 
uses her private key to sign the transaction, every one would know that `Alice` is making a private transaction,
which would destroy the anonymity property of the protocol.  

Having a third-party such as [relayer](https://ethresear.ch/t/burn-relay-registry-decentralized-transaction-abstraction-on-layer-2/5820)
to sign the transaction and pay the gas fee is promising but centralizing the protocol.
Integrating with TomoZ allows to create a privacy fee vault that is initially deposited by the issuer/owner of the privacy contract.

For every anonymous send transaction, `Alice` uses her private key to create cryptographic proofs: RingCT, Bulletproofs,
a brand new account/private key without TOMO is used for signing as `msg.sender`.
The actual network fee will be paid from the privacy vault fee to masternodes through TomoZ protocol.
On the other hand, to compensate the privacy transaction fee paid for masternodes, `Alice` sends a 0.01 TOMO fee 
to the issuer/owner within the smart contract execution of the anonymous transaction.
The transaction fee flow is as the following figure.

![privacyfee](/assets/privacyfee.png){#fig:privacyfee}*Figure 1: Privacy transaction fee and TomoZ integration*


### TomoP's privacy address
TomoP uses a single private key to generate a dual-key system.
The user private key `s` of the user's TOMO address is called private spend key and `v = SHA256(s)` is 
the private view key of the user.
As the names imply:
* `s`: This is used for making cryptographic proofs for spending funds in the privacy contract.
* `v`: This is used for viewing the information of all transactions belonging to the user. 
Having `v` only allows to see the transaction history of the user, but does not allow to spend funds.
This could be used as a tool for authorized parties to check the transaction history of a user
by requiring the user to register her private view key to the authorized parties for regulatory compliance purposes.

Each private spend key `s` has an associated privacy address. 
The latter is Base58 encoding of the public spend (`S`) and public view (`V`) keys derived from `s` and `v`.  

When `Alice` wants to make anonymous send to `Bob`, `Bob` needs to send his privacy address
to `Alice`.

## Ring Confidential Transaction and Bulletproofs

### Confidential transaction
[Confidential transaction](https://people.xiph.org/~greg/confidential_values.txt) was proposed for 
Bitcoin privacy integration by Greg Maxwell.
It uses Pedersen commitment to encrypt transaction amounts using randomly generated masks.
Cryptographically, confidential transaction states that the sum of Pedersen commitments of all input `notes`
must be equal to the sum of all Pedersen commitments of all output `notes`. 
Users are recommended to check [confidential transaction](https://people.xiph.org/~greg/confidential_values.txt)
to better understand how it works.

What confidential transaction does not support is transaction sender anonymity, which is
supported by Ring Confidential Transaction (RingCT) implemented by Monero.
RingCT is the combination of [Ring Signature](https://en.wikipedia.org/wiki/Ring_signature) and Confidential Transaction.
Ring Signature allows to obfuscate transaction sender in an anonymity set, whose size is 12 in TomoP.


RingCT, however, requires the support of a zero-knowledge range proof in order to prove
the transaction amount committed in a Pedersen commitment is positive to prevent from double spending.
This is supported by [Bulletproofs](https://eprint.iacr.org/2017/1066.pdf) which supports short non-interactive proofs without a trusted setup for confidential transactions. 

### Range proofs with Bulletproofs
Range proofs is a type of zero-knowledge proof used for proving that a 
secret value is within a value range without revealing the precise value of the secret. 
Bulletproofs is a new non-interactive zero-knowledge proof protocol 
with very short proofs and without a trusted setup; the proof size 
is only logarithmic in the witness size. 

TomoP uses Bulletproofs range proof to prove the transaction amount commited in Pedersen commitments is positive.
Both Bulletproofs and RingCT are implemented in our [privacy SDK](https://github.com/tomochain/privacyjs).

## Implementation

### Privacy precompiled contracts
To reduce the gas consumption of RingCT and Bulletproof verification, we propose two precompiled contracts, 
`RingCTVerifier` and `BulletproofVerifier`, that are implemented in the core EVM of TomoChain, using Golang.
These two precompiled contracts will be called by the privacy contract to verify the confidential transaction and Bulletproof
range proof, respectively. 
The current addresses for those precompiled contracts are 0x000000000000000000000000000000000000001e and 0x0000000000000000000000000000000000000028.

### Anonymize TOMO
Anonymizing TOMO is equal to making a deposit transaction to the privacy contract.
The deposit transaction creates a new `Note` `n` in the privacy contract that has the following cryptographic elements:

* A transaction public key `P`<sub>tx</sub>
* A stealth, one-time public key `P`<sub>st</sub>
* A pedersen commitment `C` of the deposit amount

A deposit fee of 0.001 TOMO is applied to pay transaction fees for 
the person who deposits to the privacy transaction fee vault.

Once deposited, the privacy smart contract records that the person that has the private key corresponding to
the deposit stealth public key has the deposit amount in a note.

### Anonymous send
Suppose `Bob` wants to receive `x` TOMO from `Alice` via an anonymous send transaction.

1. `Bob` sends his privacy address to `Alice`
2. `Alice` derives a stealth one-time public key `Stealth`<sub>b</sub> as follows:
    * `Alice` decode the Base58 privacy address of `Bob` to have the public spend `S`<sub>b</sub> 
    and public view `V`<sub>b</sub> key of `Bob`.
    * `Alice` generates a random 256-bit number transaction private key `s`<sub>tx</sub> and computes 
    the corresponding transaction public key `S`<sub>tx</sub> `= s`<sub>`tx`</sub>`*G`. 
    * `Alice` computes the Elliptic Curve Diff Hellman (ECDH) `E = s`<sub>tx</sub>`* V`<sub>b</sub>
    * `Alice` computes `Stealth`<sub>b</sub> = `E * G + S`<sub>b</sub>.
3. `Alice` generates Pedersen commitment for the transaction amount `x`.
    * `Alice` randomly generates a 256-bit number called mask `m`
    * `Alice` creates a pedersen commitment `C = m*G + x*H`
    * `Alice` encrypts `m` and `x` using the Elliptic Curve Diff Hellman `E` with an Advanced Encryption Standard (AES) algorithm. 
    Let's denote the cipher text produced by this encryption `MX`.
4. `Alice` generates ring confidential transaction RingCT `sig` for the transaction (details are provided later).
5. `Alice` generates a bulletproof range proof `bp` to prove that `x` is positive without revealing the value of `x`. 
6. `Alice` bundles (`S`<sub>tx</sub>, `Stealth`<sub>b</sub>, `C`, `MX`, `sig`, `bp`) into the data of a transaction,
generates a random private key to sign the transaction (to anonymize `msg.sender`), and sends the signed 
transaction to the privacy smart contract.

The generation of RingCT and Bulletproofs will be posted in details in TomoChain's technical blog later. 

Note that RingCT is generated by taking into account the transaction fee of 0.01 TOMO.
The algorithm to generate `sig` is similar to the one described in [Monero RingCT](https://lab.getmonero.org/pubs/MRL-0005.pdf).

In Step 6, TomoZ empowers the anonymization of `msg.sender` through the privacy fee vault and the paying of transaction 
fee within the internal execution of the privacy smart contract.

### Anonymous send transaction verification on smart contracts
The privacy smart contract basically verifies: 

* The existence of all input notes in in the transaction
* The validity of the ring confidential transaction (RingCT) `sig` by calling `RingCTVerifier` precompiled contract.
* The validity of Bulletproofs `bp` by calling `BulletproofVerifier` precompiled contract.

### Anonymous reception of TOMO
Once the transaction is confirmed, `Bob` needs to scan all newly created `notes` on the privacy smart contract
to recognize which one belongs to him.
`Bob` uses his private view key to decode the encrypted transaction amount. 
A proof-of-concept code for the privacy contract can be found [here](https://github.com/phamvancam2104/privacy-contracts).

Due to the math complexity of RingCT and Bulletproofs, we omit the construction algorithms for those proofs here
and will detail them in TomoChain's tech blog.

## Private token standard
TomoP is designed to support private tokens issued on TomoChain.
A new private token standard TRC21P will be supportec by extending the TRC21 token standard. 

## Regulatory compliance
By using a dual-key-like system, any user could register her/his private view key to an authorized authority.
The latter will then be able to decode all transactions that involve the user but will not be able to 
create an anonymous send transaction.  
The authorized authority would be the goverment tax agency or any organization that allows to track user transactions
for legal purposes.
Even a bank could use TomoP to keep track of their user balance while leaving only authorized users with private
spend keys to make transactions.

## References

On-going development Github repositories for TomoP

1. [https://github.com/phamvancam2104/privacy-contracts](https://github.com/phamvancam2104/privacy-contracts) - contains privacy and utility contract solidity code
2. [https://github.com/anhntbk08/tomochain/commits/privacy](https://github.com/anhntbk08/tomochain/commits/privacy) - contains source code for precompiled contracts
3. [https://github.com/tomochain/tomowallet-web-testnet](https://github.com/tomochain/tomowallet-web-testnet) - proof-of-concept web wallet
5. [https://github.com/tomochain/privacyjs](https://github.com/tomochain/privacyjs) - SDK for TomoP to make anonymous transactions