# CommodityBackedStablecoin

## Project Overview
This project implements an algorithmic stablecoin that is pegged to real-time prices of gold (80%), silver (10%), and copper (10%) using Chainlink price feeds.

The stablecoin is deployed on the **Amoy Polygon** testnet and integrates Chainlink oracles for real-time commodity price tracking.

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
1. Clone the repository:
   ```bash
   git clone https://github.com/YOUR_USERNAME/CommodityBackedStablecoin.git
   cd CommodityBackedStablecoin
# CommodityBackedStablecoin
