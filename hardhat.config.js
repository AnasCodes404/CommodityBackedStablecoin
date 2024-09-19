require("@nomiclabs/hardhat-ethers");
require("dotenv").config();

module.exports = {
  solidity: {
    version: "0.8.24", // Or any other compatible version
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  networks: {
    amoyPolygon: {
      url: "https://rpc-amoy.polygon.technology", // RPC URL for Amoy Polygon
      chainId: 80002, // Chain ID for Amoy Polygon
      accounts: [`0x${process.env.PRIVATE_KEY}`] // Your MetaMask private key (from .env)
    }
  }
};
