# noir_sepolia_demo

### Deploying a Noir Verifier Contract to Sepolia/Holesky Testnet

This repository demonstrates how to deploy a Noir-generated Solidity Verifier contract to a **real Ethereum testnet** (Sepolia or Holesky) using **Foundry**.  

Previously, we worked with local deployments on **Anvil** [noir_solidity_verifier_demo](https://github.com/cypriansakwa/noir_solidity_verifier_demo).
 Now, we extend this workflow to public testnets, gaining hands-on experience with **deployment, verification, and interaction on Etherscan**.

---

## 🚀 Learning Objectives
By following this tutorial, you will:
- Safely configure MetaMask for testnets  
- Manage secrets using a `.env` file  
- Fund test accounts with faucet ETH  
- Deploy Noir’s `Verifier.sol` contract on Sepolia/Holesky  
- Verify the deployed contract on Etherscan  

---

## ⚠️ Safety First
- **Never use Mainnet accounts** for testing.  
- Use a **throwaway MetaMask account** (new key, testnet-only).  
- Secure your `.env` file:
  ```bash
  chmod 600 .env
  grep -qxF ".env" .gitignore || echo ".env" >> .gitignore
  ```
- Do not paste your private key into public repos or chats.
- Double-check that you are on Sepolia/Holesky RPC before deploying.

## 🔑 Setup

### 🦊 MetaMask
- Create a **new account** in MetaMask for testing only.  
- Export the **private key** (⚠️ use only for testnets, never Mainnet).  

### 💧 Fund with Faucet ETH
- [Sepolia Faucet (Alchemy)](https://sepoliafaucet.com)  
- [QuickNode Sepolia Faucet](https://faucet.quicknode.com/ethereum/sepolia)  
- [Holesky Faucet](https://holeskyfaucet.com)  

## 📂 .env Configuration
Create `.env` inside `contract/`:

```bash
PRIVATE_KEY=0xYOUR_TEST_PRIVATE_KEY
RPC_URL=https://eth-sepolia.g.alchemy.com/v2/YOUR_KEY
CHAIN_ID=11155111
ETHERSCAN_API_KEY=YOUR_ETHERSCAN_KEY   # optional
```

## 🔧 Foundry Setup
In `foundry.toml`, you can add endpoints for convenience:

```bash
[rpc_endpoints]
sepolia = "https://eth-sepolia.g.alchemy.com/v2/YOUR_KEY"
holesky = "https://ethereum-holesky.publicnode.com"

[etherscan]
sepolia = { key = "${ETHERSCAN_API_KEY}", chain = 11155111 }
```

## 🛠️ Build & Sanity Check
```bash
cd contract
forge build --sizes
```
## 📜 Deployment Script

File: `script/Deploy.s.sol`
```solidity
contract DeployScript is Script {
    function run() external {
        vm.startBroadcast();
        Verifier verifier = new Verifier();
        vm.stopBroadcast();
    }
}
```

### Example Output
```yanl
Verifier deployed at: 0xdF7b738ECa9FDEf817f0193f...
Chain 11155111
Tx Hash: 0x05c3d224391d0aa7f0632b6b17ddd899b59...
```
## ✅ Verification on Etherscan

With your API key, you can auto-verify:
```bash
forge script script/Deploy.s.sol:DeployScript \
  --rpc-url $RPC_URL \
  --private-key $PRIVATE_KEY \
  --broadcast \
  --verify \
  --etherscan-api-key $ETHERSCAN_API_KEY

```
If successful, you’ll see:
```nginx
Contract successfully verified!
```
### ✅ Then check on Etherscan
👉 [View your contract on Sepolia Etherscan](https://sepolia.etherscan.io/address/YOUR_CONTRACT_ADDRESS)

---

## 📌 Summary

You now know how to:

- 🦊 Set up **MetaMask** test accounts  
- 🔐 Securely manage secrets with **.env**  
- 💧 Fund accounts with **faucet ETH**  
- 🚀 Deploy **Noir verifier contracts** to Sepolia/Holesky  
- 🔎 Verify contracts on **Etherscan**  

---

🎉 **Your Noir Verifier is live on Testnet and open for interaction!**


