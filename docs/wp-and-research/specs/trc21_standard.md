# TomoChain Request for Comment: TRC21 Token Standard 

| Standard Name | TRC21             |
|---------------|--------------------|
| Author        | TomoChain R&D Team |
| Category      | Token Standard     |
| Created       | 2019-05-17         |

## Simple Summary

A standard interface for tokens that allows token holders to pay transaction fees by the token itself.

## Abstract
The following standard allows for the implementation of a standard Application Programmable Interface (API) for tokens within TomoChain smart contracts. 
Tokens issued on TomoChain following this standard allows token holders to pay fee for transactions 
to the token contract in terms of the token itself.

## Motivation
A standard token interface that extends TRC-20 standard in order to allow 
holders of a token issued following this standard to make transactions without the need of 
holding TOMO in the wallet for paying transaction fees.

## TRC21 Specification

```solidity
/**
 * @title TRC21 interface
 */
interface ITRC21 {
	function totalSupply() external view returns (uint256);

	function balanceOf(address who) external view returns (uint256);

	function estimateFee(uint256 value) external view returns (uint256);
	
	function issuer() external view returns (address);

	function allowance(address owner, address spender) external view returns (uint256);

	function transfer(address to, uint256 value) external returns (bool);

	function approve(address spender, uint256 value) external returns (bool);

	function transferFrom(address from, address to, uint256 value) external returns (bool);

	event Transfer(address indexed from, address indexed to, uint256 value);

	event Approval(address indexed owner, address indexed spender, uint256 value);

	event Fee(address indexed from, address indexed to, address indexed issuer, uint256 value);
}
```

### TRC21 API specification

- `totalSupply`: Returns the token total supply.

```solidity 
function totalSupply() external view returns (uint256);
```

- ```balanceOf```: Returns the account balance of another account with address ```who```.
```solidity
function balanceOf(address who) external view returns (uint256);
```

- ```estimateFee```: Estimate the transaction fee in terms of the token that the transaction makers will have to pay.
Transaction fee will be paid to the issuer of the TRC21 token contract following our TomoZ protocol detailed in [here](https://docs.google.com/document/d/1jxD3DsU7GWhxQhs0R8hCmqIQvfQfJjAQaioBoRrVGIA/edit?usp=sharing).

```solidity	
function estimateFee(uint256 value) external view returns (uint256);
```
Ideally the function will return the transaction fee based on 
the value (the number of tokens) that the transaction maker wants to transfer.
Transaction fee for ```allowance``` function will be estimated if input parameter ```value = 0```.
The way fees are computed is not standardized.
Token issuers can fully customize the implementation of the function.
 
This function will also be called by user wallets to evaluate fees the user must be paying.

- `issuer`: Returns the address of the token issuer.  

```solidity
function issuer() external view returns (address);
```

The method returns the address of the token issuer. 
The is to ensure that only the issuer has the right to apply to the TomoZ protocol for paying fees of token-holder transactions to 
the token contract in terms of the token itself.
The method will be called by the TomoZ protocol source code to verify that no one else is able to apply
the token to the TomoZ protocol, except the issuer.

- ```transfer```: 
Transfers ```_value``` amount of tokens to address ```_to```, and MUST fire the ```Transfer``` and ```Fee``` event. 

```solidity
function transfer(address _to, uint256 _value) public returns (bool success)
```

The function will call ```estimateFee``` function to compute the transaction fee.
The function SHOULD throw if the message caller’s account balance does not have enough tokens to spend and to pay transaction fees.
Once succeeded, the token balance of the sender should be reduced by ```_value``` plus the computed transaction fee, the balance of ```_to``` should
be increasing ```_value```, while the balance of the token issuer should be increased by the computed transaction fee.

- `approve`

```solidity
function approve(address spender, uint256 value) external returns (bool);
```

Allows `_spender` to withdraw from your account multiple times, up to the `_value` amount. 
If this function is called again it overwrites the current allowance with `_value`.
This function also calls `estimateFee` with input parameter as 0 in order to compute the transaction fee
in terms of tokens that the transaction sender must pay to the token issuer.

- `allowance`

```solidity
function allowance(address owner, address spender) external view returns (uint256);
```

Returns the amount which `spender` is still allowed to withdraw from `owner`.


- `transferFrom`

```solidity
function transferFrom(address from, address to, uint256 value) external returns (bool);
```

Transfers `value` amount of tokens from address `from` to address `to`.
The function must fire the ```Transfer``` and ```Fee``` event.

### TRC21 Event specification

- `Transfer`

```solidity
event Transfer(address indexed from, address indexed to, uint256 value);
```

This event MUST be emitted when tokens are transferred in functions `transfer` and `transferFrom`.

- `Approval`

```solidity
event Approval(address indexed owner, address indexed spender, uint256 value);
```

This event MUST be emitted on any successful call to `approve` function.

- `Fee`

```solidity
event Fee(address indexed from, address indexed to, address indexed issuer, uint256 value);
```

This event MUST be emitted when tokens are transferred in functions `transfer` and `transferFrom` in order for clients/DApp/third-party wallets to notify 
its users about the paid transaction fee in terms of token.

### Implementation

The following implements the basis of the standard. 
For any implementation of the TRC21 standard, the following contract fields must be defined at the beginning of the contract.

```solidity
mapping (address => uint256) private _balances;
uint256 private _minFee;
address private _issuer;
```

This template allows the TomoZ protocol to consider the implemented token as TRC21 and any fees paid for transactions to 
the token contract will be based on the token, not TOMO.

- ```_balances```: record the balance of each token holder
- ```_minFee```: the minimum fee in terms of tokens that the transaction sender must pay. 
Ideally minFee will be paid when ``approve`` function is called or when transaction fails.
- `_issuer`: the address of the token issuer who will receive transaction fees from token holders in terms of token, 
but will pay transaction fees
to masternodes by means of TOMO. This is detailed in our TomoZ protocol specification [white paper](https://docs.google.com/document/d/1jxD3DsU7GWhxQhs0R8hCmqIQvfQfJjAQaioBoRrVGIA/edit?usp=sharing).

The implementation also defines some additional functions as follows:
- `minFee`: Returns the minimum fee for any transaction. 
- `issuer`: Returns the address of the issuer of the token.

```solidity
/**
 * @title Standard TRC21 token
 * @dev Implementation of the basic standard token.
 */
contract TRC21 is ITRC21 {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;
    uint256 private _minFee;
    address private _issuer;
    mapping (address => mapping (address => uint256)) private _allowed;
    uint256 private _totalSupply;

    /**
     * @dev Total number of tokens in existence
     */
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev  The amount fee that will be lost when transferring.
     */
    function minFee() public view returns (uint256) {
        return _minFee;
    }

    /**
     * @dev token's foundation
     */
    function issuer() public view returns (address) {
        return _issuer;
    }

    /**
     * @dev Gets the balance of the specified address.
     * @param owner The address to query the balance of.
     * @return An uint256 representing the amount owned by the passed address.
     */
    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }

    /**
     * @dev Estimate transaction fee.
     * @param value
     */
    function estimateFee(uint256 value) public view returns (uint256) {
        return value.mul(0).add(_minFee);
    }

    /**
     * @dev Function to check the amount of tokens that an owner allowed to a spender.
     * @param owner address The address which owns the funds.
     * @param spender address The address which will spend the funds.
     * @return A uint256 specifying the amount of tokens still available for the spender.
     */
    function allowance(address owner,address spender) public	view returns (uint256){
        return _allowed[owner][spender];
    }

    /**
     * @dev Transfer token for a specified address
     * @param to The address to transfer to.
     * @param value The amount to be transferred.
     */
    function transfer(address to, uint256 value) public returns (bool) {
        uint256 total = value.add(_minFee);
        require(to != address(0));
        require(value <= total);
        _transfer(msg.sender, to, value);
        _transfer(msg.sender, _issuer, _minFee);
        emit Fee(msg.sender, to, _issuer, _minFee);
        return true;
    }

    /**
     * @dev Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
     * Beware that changing an allowance with this method brings the risk that someone may use both the old
     * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
     * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     * @param spender The address which will spend the funds.
     * @param value The amount of tokens to be spent.
     */
    function approve(address spender, uint256 value) public returns (bool) {
        require(spender != address(0));
        require(_balances[msg.sender]>=_minFee);
        _allowed[msg.sender][spender] = value;
        _transfer(msg.sender, _issuer, _minFee);
        emit Approval(msg.sender, spender, value);
        return true;
    }

    /**
     * @dev Transfer tokens from one address to another
     * @param from address The address which you want to send tokens from
     * @param to address The address which you want to transfer to
     * @param value uint256 the amount of tokens to be transferred
     */
    function transferFrom(address from,	address to,	uint256 value)	public returns (bool) {
        uint256 total = value.add(_minFee);
        require(to != address(0));
        require(value <= total);
        require(total <= _allowed[from][msg.sender]);

        _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(total);
        _transfer(from, to, value);
        _transfer(from, _issuer, _minFee);
        emit Fee(msg.sender, to, _issuer, _minFee);
        return true;
    }

    /**
     * @dev Transfer token for a specified addresses
     * @param from The address to transfer from.
     * @param to The address to transfer to.
     * @param value The amount to be transferred.
     */
    function _transfer(address from, address to, uint256 value) internal {
        require(value <= _balances[from]);
        require(to != address(0));
        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
        emit Transfer(from, to, value);
    }

    /**
     * @dev Internal function that mints an amount of the token and assigns it to
     * an account. This encapsulates the modification of balances such that the
     * proper events are emitted.
     * @param account The account that will receive the created tokens.
     * @param value The amount that will be created.
     */
    function _mint(address account, uint256 value) internal {
        require(account != 0);
        _totalSupply = _totalSupply.add(value);
        _balances[account] = _balances[account].add(value);
        emit Transfer(address(0), account, value);
    }

    /**
     * @dev Transfers token's foundation to new issuer
     * @param newIssuer The address to transfer ownership to.
     */
    function _changeIssuer(address newIssuer) internal {
        require(newIssuer != address(0));
        _issuer = newIssuer;
    }

    /**
     * @dev Change minFee
     * @param value minFee
     */
    function _changeMinFee(uint256 value) internal {
        _minFee = value;
    }
}
```

### TRC21 Token example

The following shows an example of a TRC21 token which inherits from the TRC21 implementation.
Token name, symbol, and decimals are also defined.

```solidity
contract MyTRC21 is TRC21 {
    string private _name;
    string private _symbol;
    uint8 private _decimals;

    constructor (string memory name, string memory symbol, uint8 decimals, uint256 cap, uint256 minFee) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
        _mint(msg.sender, cap);
        _changeIssuer(msg.sender);
        _changeMinFee(minFee);
    }

    /**
     * @return the name of the token.
     */
    function name() public view returns (string memory) {
        return _name;
    }

    /**
     * @return the symbol of the token.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    /**
     * @return the number of decimals of the token.
     */
    function decimals() public view returns (uint8) {
        return _decimals;
    }
}
```


