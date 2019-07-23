# Building Your First Game dApp On TomoChain (Part 2)

Interesting challenge by building a simple lucky dApp game with Truffle Framework, Cocos Creator and deploy to TomoChain. 💪

## Install programs and design UI

* Install some programs
    - Cocos Creator v2.1.1 (Download)
    - Visual Studio Code (Download)
* Design UI
    - Use your favorite design software to make a design for our game 😎

We will have 3 main screens: *Home, Main Game, Result*.

![TomoLuckeyBox](/assets/tomoluckeybox.png)

## Create Cocos Creator project

For making this tutorial simple, I will not go through the details on every step of the implementation for UI on editor. I recommended you read Cocos Creator documents for understand more about how editor working.

* Open Cocos Creator -> Choose Empty Project and put your project name.

![Cocos](/assets/cocos.png)

* Structure our project and create game components 

We create the main scene of our game (Game Scene) and create all components like Background,Button, Layout, Label, Animation… and make sure it will same with our design.

![Cocos Structure](/assets/cocosstructure.png)

* Drinking coffee and complete your core gameplay ☕️ ☕️ ☕️ ☕️ ☕️

After some hours, we completed implement core gameplay of our game without interact with smart contract.

[![](http://img.youtube.com/vi/upZ4ZKROqxE/0.jpg)](http://www.youtube.com/watch?v=upZ4ZKROqxE "TomoLuckyBox without TomoChain integration")

## Interact between Cocos Creator and smart contract using web3.js

* Add web3.js to project

    - Download web3.js.min (Link)
    - Drag & drop web3.js.min to folder assets/libs in our project (if have a dialog ask to add as plugin, remember click No)

* Add TomoLuckyBox.json to project
    - Drag & drop TomoLuckyBox.json in truffle project folder build/to folder assets in our project.

![TomoLuckyBox project structure](/assets/luckyboxstructure.png)

* Create ‘Web3Controller.js’ class to handle all interact with smart contract using web3.js

Check full source code of `Web3Controller.js` on [GitHub](https://github.com/frogdevvn/tomoluckybox-example-cocoscreator/blob/master/assets/scripts/Web3Controller.js?source=post_page---------------------------).


Let’s walk through `Web3Controller.js` and understand what’s happening on the front-end.

We will define our app variable and declare variables we will use throughout `Web3Controller.js`

```javascript
Web3: null, // Web3 instance which injected by MetaMask
Web3Provider: null, // Current provider in Web3
Web3ProviderName: "metamask", // Current provider name in Web3
Contract: null, // TomoLuckyBox contract object
ContractABI: cc.JsonAsset, // Ref to ABI JSON file of contract 
CurrentAccount: "", //Current player address
const TOMOLUCKYBOX_CONTRACT_ADRESS_TESTNET = "0x6f6591b7F61EB82BCeF137792237263a428ef83d"; // Address of our smart contract on TomoChain Testnet
```

We will also add an `initWeb3` function in which will initialize `Web3` provider. 
Web3 provider allows your application to communicate with TomoChain through MetaMask or TomoWallet.


* **initWeb3**

MetaMask or TomoWallet will inject web3.js into our browsers. Here, we will check if any Web3 provider already exists, then we will initAccount and initContract and then initBalance.

```javascript
initWeb3() {
    if (isWeb3Enabled()) {
      this.Web3 = new Web3();

      //Request account access for modern dapp browsers
      if (window.ethereum) {
        this.Web3ProviderName = "metamask";
        this.Web3Provider = window.ethereum;
        this.Web3.setProvider(this.Web3Provider);
        window.ethereum
          .enable()
          .then(accounts => {
            Web3Controller.instance.initAccount();
            Web3Controller.instance.initContract();
          })
          .catch(error => {
            cc.error(error);
          });
      }
      //Request account access for legacy dapp browsers
      else if (window.web3) {
        this.Web3ProviderName = "tomowallet";
        this.Web3Provider = window.web3.currentProvider;
        this.Web3.setProvider(this.Web3Provider);

        Web3Controller.instance.initAccount();
        Web3Controller.instance.initContract();
      }
    } else {
      cc.error(
        "You must enable and login into your TomoWallet or MetaMask accounts!"
      );
    }
  },
```

* **initContract**

After compiled Truffle project in part 1, it gives us the boilerplate code to interact with the contract (TomoLuckyBox.json in folder /build). 
We use ABI (Application Programming Interface), a JSON representation of our contract to interact with TomoChain.


We initiate our TomoLuckyBox contract by using `web3.eth.Contract` from `web3.js`.

```javascript
initContract() {
    this.Contract = new this.Web3.eth.Contract(
      this.ContractABI.json.abi,
      TOMOLUCKYBOX_CONTRACT_ADRESS_TESTNET
    );
  },
```

* **initAccount**

For get current player address in provider, we will use web3.eth.getAccounts from web3.js . This async function will return an array of account in MetaMask or TomoWallet. Then we can get current account by get the first element in accounts array. After that, we call initBalance to get current TOMO balance of player and update to UI on front-end.

```javascript
initAccount() {
    this.Web3.eth.getAccounts().then(accounts => {
      if (accounts.length > 0) {
        Web3Controller.instance.CurrentAccount = accounts[0].toLowerCase();
        HUDController.instance.updateAccountText(
          Web3Controller.instance.CurrentAccount
        );
        Web3Controller.instance.initBalance();
      } else
        cc.error(
          "You must enable and login into your TomoWallet or MetaMask accounts!"
        );
    });
  }
```

* **initBalance**

Get balance of player is very easy, web3.js provide us a simple function `web3.eth.getBalance` After have that value, we will update UI on front-end to show that value.

```javascript
initBalance() {
    this.Web3.eth.getBalance(
      Web3Controller.instance.CurrentAccount,
      (err, balance) => {
        if (err) {
          cc.err(err);
          return;
        }

        HUDController.instance.updateBalanceText(
          Web3Controller.instance.getTOMOFromWei(balance)
        );
      }
    );
  }
```

Now, let’s see our core function sendRequestOpenLuckyBox, in this function we will call to randomLuckyBox function in our smart contract on TomoChain.

For call a function in smart contract, we need use method call in web3.js. After our smart contract random lucky box then it return result to front-end with events.

Events are a crucial part of any dApps. Asynchronous and blockchain transactions take time. Events help us in tracking the status inside the dApp.

We are listening to event LogRandomLuckyBoxSuccessed and passing result object to our render logic.


```javascript
sendRequestOpenLuckyBox() {
    if (GameController.instance.selectedLuckyBoxId != 0) {
      this.Contract.methods
        .randomLuckyBox(GameController.instance.selectedLuckyBoxId)
        .send({
          from: Web3Controller.instance.CurrentAccount,
          value: Web3Controller.instance.Web3.utils.toWei(
            PRICE_PER_OPEN,
            "ether"
          ),
          gas: 250000,
          gasPrice: GAS_PRICE_DEFAULT
        })
        .on("transactionHash", hash => {
          cc.log("transactionHash: ", hash);
        })
        .on("receipt", receipt => {
          cc.log("receipt: ", receipt);
          let returnValues =
            receipt.events.LogRandomLuckyBoxSuccessed.returnValues;
          let result = parseInt(returnValues[1]);
          let amountPrize = Web3Controller.instance.getTOMOFromWei(
            returnValues[3]
          );
          Web3Controller.instance.initBalance();
          GameController.instance.unselectAllLuckyBox();
          GameController.instance.showResultOpenLuckyBox(result, amountPrize);
        })
        .on("error", error => {
          cc.error("sendRequestOpenLuckyBox: ", error);
        });
    } else {
      cc.error("sendRequestOpenLuckyBox failed!");
    }
  },
```

## Conclusion

dApps are a new paradigm to for building applications on the internet, and we’re just scratching the surface. In the future, you will see dApps become more popular.

dApps decentralize the way we interact on the internet. dApps run on decentralized networks, in our case TomoChain blockchain, but not every dApp needs to be built with a blockchain.

Congratulations! You have finished our tutorial to make a game using Cocos Creator and deploy it to TomoChain. You have all the tools you need to start making more advanced dApps and now you can make your dApp live and deploy it to TomoChain, the most efficient blockchain for the token economy!

## Source Code

Available on GitHub:
* Client: [tomoluckybox-example-cocoscreator](https://github.com/frogdevvn/tomoluckybox-example-cocoscreator?source=post_page---------------------------)

* Truffle — Smart Contract: [tomoluckybox-smartcontract](https://github.com/frogdevvn/tomoluckybox-smartcontract?source=post_page---------------------------)
