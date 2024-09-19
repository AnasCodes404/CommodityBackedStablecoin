// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import Chainlink interface for price feeds
import "./interfaces/AggregatorV3Interface.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CommodityBackedStablecoin is ERC20, Ownable {
    // Chainlink price feed addresses for gold, silver, and copper
    AggregatorV3Interface internal goldPriceFeed;
    AggregatorV3Interface internal silverPriceFeed;
    AggregatorV3Interface internal copperPriceFeed;

    // Constructor to set the price feed addresses and pass the owner address to Ownable
    constructor(
        address _goldPriceFeed, 
        address _silverPriceFeed, 
        address _copperPriceFeed,
        address initialOwner
    ) ERC20("CommodityBackedStablecoin", "CBS") Ownable(initialOwner) {
        // Explicitly cast the provided addresses to AggregatorV3Interface
        goldPriceFeed = AggregatorV3Interface(_goldPriceFeed);
        silverPriceFeed = AggregatorV3Interface(_silverPriceFeed);
        copperPriceFeed = AggregatorV3Interface(_copperPriceFeed);
    }

    // Function to get the latest price of gold from Chainlink
    function getLatestGoldPrice() public view returns (int) {
        (, int price,,,) = goldPriceFeed.latestRoundData();
        return price;
    }

    // Function to get the latest price of silver from Chainlink
    function getLatestSilverPrice() public view returns (int) {
        (, int price,,,) = silverPriceFeed.latestRoundData();
        return price;
    }

    // Function to get the latest price of copper from Chainlink
    function getLatestCopperPrice() public view returns (int) {
        (, int price,,,) = copperPriceFeed.latestRoundData();
        return price;
    }

    // Function to calculate the stablecoin price based on weighted prices of gold, silver, and copper
    function calculateStablecoinPrice() public view returns (int) {
        int goldPrice = getLatestGoldPrice();
        int silverPrice = getLatestSilverPrice();
        int copperPrice = getLatestCopperPrice();

        // Apply the 80%, 10%, 10% weighting formula for gold, silver, and copper respectively
        int stablecoinPrice = (goldPrice * 80) / 100 + (silverPrice * 10) / 100 + (copperPrice * 10) / 100;
        return stablecoinPrice;
    }

    // Function to mint stablecoins based on the calculated stablecoin price
    function mintStablecoin(uint256 amount) public onlyOwner {
        int stablecoinPrice = calculateStablecoinPrice();
        require(stablecoinPrice > 0, "Price calculation error");
        _mint(msg.sender, amount);
    }
}
