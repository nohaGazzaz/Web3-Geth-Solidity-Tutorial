# Web3-Geth-Solidity-Tutorial
---

## Setting the Environment
### Installing Geth
As i've mentioned in the introduction i'm using ubuntu so these commands could work on Mac OS, as for window users please check reference below.

To enable the launchpad repository you must run:
```
sudo add-apt-repository -y ppa:ethereum/ethereum
```
Then to install the latest version of Go Ethereum:
```
sudo apt-get update
sudo apt-get install ethereum
```
### Installing nodejs
First you would need to install nodejs, you may do so by writing this command:
```
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
```

---

## Example
### Creating a Geth Account and mining 
Create a directory called `testnet` go into testnet and create another directory called `node1`:
```
mkdir testnet
cd testnet
mkdir node1
```
Create an account (Passwords are not necessary for a local network):
```
geth --datadir node1 account new
```
geth will print out the address, which is like an identifier. Denote the hexadecimal values as `{ADDR1}`.

Create a new blockchain genesis file with puppeth. This specifies the first block of the new blockchain, as well as gives the users some ether to start with. Some of the output below has been truncated for brevity.
```
$puppeth
+-----------------------------------------------------------+
| Welcome to puppeth, your Ethereum private network manager |
|                                                           |
| This tool lets you create a new Ethereum network down to  |
| the genesis block, bootnodes, miners and ethstats servers |
| without the hassle that it would normally entail.         |
|                                                           |
| Puppeth uses SSH to dial in to remote servers, and builds |
| its network components out of Docker containers using the |
| docker-compose toolset.                                   |
+-----------------------------------------------------------+


Please specify a network name to administer (no spaces or hyphens, please)
> testnet


Sweet, you can set this via --network=testnet next time!


INFO [07-18|22:11:25.357] Administering Ethereum network           name=testnet
WARN [07-18|22:11:25.357] No previous configurations found         path=/home/localadmin/.puppeth/testnet


What would you like to do? (default = stats)
1. Show network stats
2. Configure new genesis
3. Track new remote server
4. Deploy network components
> 2


Which consensus engine to use? (default = clique)
1. Ethash - proof-of-work
2. Clique - proof-of-authority
> 2


How many seconds should blocks take? (default = 15)
> <ENTER>


Which accounts are allowed to seal? (mandatory at least one)
> 0x{ADDR1}
> 0x<ENTER>


Which accounts should be pre-funded? (advisable at least one)
> 0x{ADDR1}
> 0x<ENTER>


Specify your chain/network ID if you want an explicit one (default = random)
><ENTER>
INFO [07-18|22:11:39.294] Configured new genesis block


What would you like to do? (default = stats)
1. Show network stats
2. Manage existing genesis
3. Track new remote server
4. Deploy network components
> 2


1. Modify existing fork rules
2. Export genesis configuration
3. Remove genesis configuration
> 2


Which file to save the genesis into? (default = testnet.json)
><ENTER>
INFO [07-18|22:11:44.487] Exported existing genesis block


What would you like to do? (default = stats)
1. Show network stats
2. Manage existing genesis
3. Track new remote server
4. Deploy network components
> <CTRL-C>
``` 
Now start the node. Open two terminals in the testnet directory, which I'll label `serv1`, `console1`. Below, shell prompts will be prefixed with the name of the terminal.
```
serv1$ geth --datadir node1 init testnet.json
serv1$ geth --datadir node1 --port 3000
console1$ geth attach ipc:node1/geth.ipc
```
Start mining.
```
> personal.unlockAccount(eth.coinbase)
> eth.defaultAccount = eth.coinbase
> miner.start()
```
if you want the node to mine forever then after initiating the genesis file in `serv1`(which is the first command in serv1 ) create a file called `password` if you created a password for your account save your password there without quotations if not then leave the file empty
```
$ vim password
<i>
password
<:wq!>
$ geth --datadir node1 --mine --unlock "0" --password password
```
Now you managed to install Geth (a real blockchain) create an Ethereum account, and started mining.
Creating a smart contract


### Compiling, deploying and interacting with smart contract 
 


---

## References
* https://geth.ethereum.org/
* https://medium.com/r/?url=https%3A%2F%2Fgithub.com%2Fethereum%2Fgo-ethereum
* https://github.com/ethereum/go-ethereum/wiki/geth
* https://ethereum.github.io/go-ethereum/install/
* http://solidity.readthedocs.io/en/v0.4.24/
* https://medium.com/@mvmurthy/full-stack-hello-world-voting-ethereum-dapp-tutorial-part-1-40d2d0d807c2
* https://github.com/ethereum/web3.js/
* https://codeburst.io/build-your-first-ethereum-smart-contract-with-solidity-tutorial-94171d6b1c4b?gi=71fff6308e89
* https://hackernoon.com/crossing-over-to-web3-an-introduction-to-decentralised-development-5eb09e95edb0
* https://nodejs.org/en/download/package-manager/
* https://modalduality.org/posts/puppeth/
