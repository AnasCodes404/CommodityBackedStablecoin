# CommodityBackedStablecoin

## Project Overview

This project implements an algorithmic stablecoin that is pegged to real-time prices of gold (80%), silver (10%), and copper (10%) using Chainlink price feeds.  
The stablecoin is deployed on the **Amoy Polygon testnet** and integrates Chainlink oracles for real-time commodity price tracking.

## Features

- Fetch real-time gold, silver, and copper prices using Chainlink price feeds.
- Mint stablecoins based on the weighted average price of the commodities.
- Only the contract owner can mint new stablecoins.

## Contract Details

- **Contract Name**: `CommodityBackedStablecoin`
- **Contract Address**: `0xa1C93A5e0B0220d3E882FE76f026860cE7Cc3560` (Deployed on Amoy Polygon testnet)

## Usage

### Requirements
- Node.js v14 or higher
- Hardhat

### Installation

# 1. Clone the repository:
git clone https://github.com/YOUR_USERNAME/CommodityBackedStablecoin.git
cd CommodityBackedStablecoin

# 2. Install dependencies:
npm install

# 3. Deployment
# Make sure you have your private key and other network settings properly configured in .env before deploying.

# Deploy the contract to the Amoy Polygon testnet:
npx hardhat run scripts/deploy.js --network amoyPolygon

# 4. Interacting with the Contract
# Use the Hardhat console to interact with the deployed contract:
npx hardhat console --network amoyPolygon

# Once inside the console, load the contract:
const stablecoin = await ethers.getContractAt("CommodityBackedStablecoin", "0xa1C93A5e0B0220d3E882FE76f026860cE7Cc3560");

# 5. Commands to Interact

# Fetch the Latest Gold Price:
const goldPrice = await stablecoin.getLatestGoldPrice();
console.log(goldPrice.toString());

# Fetch the Latest Silver Price:
const silverPrice = await stablecoin.getLatestSilverPrice();
console.log(silverPrice.toString());

# Fetch the Latest Copper Price:
const copperPrice = await stablecoin.getLatestCopperPrice();
console.log(copperPrice.toString());

# Mint Stablecoins (only available for the owner):
await stablecoin.mintStablecoin(1000); // Mint 1000 stablecoins

# Check Balance of an Address:
const balance = await stablecoin.balanceOf("YOUR_ADDRESS");
console.log(balance.toString());

# 6. Verifying the Contract
# You can view and verify the contract on the Amoy Polygonscan Block Explorer:
https://amoy.polygonscan.com
