# PROGRESS REPORT
So far so good, this is a report of the progress I've made during the course of our first week together.

First is an introduction to web3, where we primarily talked about blockchains.

So, a blockchain is like a decentralised and immutable digital ledger (by immutable, we mean that no changes can be made to it). It is a public database that is updated and shared across many computers (nodes) in a network.For a better explanation of the term, let's split  blockchain  into it's two components, Block and Chain. Then, we'll  look at the way a blockchain functions. On a blockchain, requests for computations are known as "Transaction requests". Before a responce is returned for such request from the server, it first has to be verified, validated, and executed by other nodes. The feedback we recieve is known as a "block", which is fundamentally a group comprised of the inputted  'data' and the current 'state' of the blockchain after this data has been inputted. It is the collection of these blocks that we refer to as a "Blockchain", as each "Block" is cryptographically linked to their parent block by a special key , thereby creating a "chain".  This design ensures that a block cannot be changed without altering  all subsequent (follow up) blocks,which would require  effecting the change across the entire network. 

 In blockchain technologies, there are three major requirements that must be met in order to achieve optimal functionality, and these are:
1. Decentralisation
2. Security, and
3. Scalability.
   
  Below are a breakdown of these points:
1. Decentralisation: By decentralisation, we refer to the seperation of the governing powers of the blockchain such that no single entity has complete control over the state of affairs of the blockchain. Instead, every member (or node) on the network is free to operate mostly independent of others and has a say in the governance of the blockchain. 
2. Security: By security, we talk about how safe the information present/stored on the blockchain is at any given time. Data contained in Blockchains in every sense of the word must be retrievable in its correct state even in an occassion of loss or damage for the integrity of such blockchain to be affirmed.
3. Scalability: By scalability we mean growth; growth in the sense that blockchain technologies should be able to adjust to accomodate an increase in the number of its users (expansiveness).

However, the sad reality is that achieving these three objectives simultaneously(i.e at the same time) is a seemingly ordeous task, because in order to achieve decentralisation and security, one would have to give up scalability (or vice-versa, with the other elements in any order). This situation has even been termed the 'Blockchain trilemma'. In our web development journey, we shall be looking for ways to achieve decentralisation and security without having to give up scalability.

L2 (Layer 2) is a collective term used to describe a specific set of Ethereum scaling solutions. They are seperate blockchains which extends Ethereum while inheriting its security guarantees. Ethereum expands blockchain technologies by introducing a new concept known as Smart Contracts. 

Smart contracts are self-executing programs that run on a blockchain. These automate agreements and manage digital assets without the need for any middlemen, thereby enabling trustless transactions. They serve as a foundation for building decentralised apps, organisations and systems in a permisionless and censorship-resistant manner. 

Also worthy to note is the fact that Smart contracts are, like blockchains, immutable, that is to say that, once deployed, they can never be updated. This is why special sites known as testnets are provided so you can test-run your contract and make any necessary adjustments before actually deploying it on the blockchain. However, one is able to modify the state of a contract by creating and storing new  values on it, although such operations will cost a fee (otherwise known as gas money).       

N/B: Deploying a contract in the first instance is regarded to as modifying it and thus costs gas money. Likewise, viewing the state of the contract does not cost money.

# DEPLOYING SMART CONTRACTS ON LISK (SEPOLIA)
After writing your smart contract, you'll have to deploy it to allow other people to interact with it. There are two ways of deploying smart contracts on Lisk (Sepolia) i.e either by using Foundry or Hardhat. However, for the sake of time we only looked at deploying smart contracts with Hardhat. Below are the simple steps we took in order to deploy a smart contract with Hardhat on Lisk (Sepolia).
1. Initialise the project: Go to any terminal of your choice on your system, be it Command Prompt, Windows Powershell terminal, or the one in Visual Studio code. Once there, follow these simple steps:
   
(a) We started by creating and switching to a new directory which we named LiskHardhat using:
         mkdir Lisk-Hardhat 
         cd Lisk-Hardhat
         
(b) Initialise the project with npm
       npm init --y
This generates a 'package.json' file with default configurations.

(c) Install Hardhat as a development dependency
       npm install --save-dev hardhat             
       
(d) Initialise Hardhat in your project
       npx hardhat init
Follow the steps that will be shown to set up your hardhat

(e) Install dotenv to manage sensitive information such as passwords and private wallet keys
       npm install --save-dev dotenv
           
2. Update Hardhat configuration: Edit the 'hardhat.config.js' file to the current feature
3. Prepare the deployment script: Create a  deployment module in the 'ignition/modules' directory (e.g. Lock.js) to define the logic for deploying your contract.
4. Set up environment variables: Create a '.env' file in the root of your project. Inside it, insert your wallet private key. Remember to keep this file secure and never share it publicly as any body who has knowledge of your wallet private key can gain access to your Metamask wallet and then have the power to tamper with your finances.
5. Deploy your contract: Use the following command to deploy your contract:
    npx hardhat ignition deploy ignition/modules/Lock.js --network lisk-sepolia --verify
where: ignition/modules/Lock.js : The path to your deployment script
              --network lisk-sepolia : specifies the Lisk Seplia network
              --verify : ensures the contract gets verified on Blockscout 
  
# COMPONENTS OF A SMART CONTRACT
Below are some basic features that every smart contract should contain:
1. An SPDX-Licence-Identifier, which specifies the licence under which the code is shared e.g. MIT.
2. A Pragma directive: This indicates the Solidity compiler version reguired for th execution of such project. This ensures compatibility and access to modern features and security updates.
3. Contract definition : defines the contract by giving it a name.
4. Enum declaration : which generates an enumeration.
5. Struct declaration : which defines a data structure. This groups related data together, making it easier to manage. A Struct performs a similar function to an Object in JavaScript.
6. A Mapping: This is a key-value store meant for storing two things, say an Ethereum address to a Struct.
7. An event keyword : used to define events
8. Other functions which lie within the smart contract. Solidity Visibility specifiers dictates the identity of the msg.sender (i.e the people who have access to and are able to call a funtion contained within the smart contract). Based on this, contract functions can be divided into four, that is:
   
(a) Public functions : where anyone can access and call such function.

(b) Private functions : which can be called only by the creator.

(c) Internal functions : Only called by and inherited function.

(d) External functions : which can be called by any other function other than the inherited ones.  

N/B: By default, any unspecified function is regarded as a private function by the server. Also, the "public" keyword automatically generates a "getter" function. For in-function variables, we use the "memory" keyword which specifies temporary data storage, very much like "let" keyword in JavaScript.

(9) Input validations: These ensures that inputs to be filled into the contract is correctly done. This is done using the "required" keyword, which will revert the contract if the input validation conditions are not met.

