async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);

    // Passing zero addresses to use the fallback behavior for testing
    const goldPriceFeedAddress = "0x0000000000000000000000000000000000000000";
    const silverPriceFeedAddress = "0x0000000000000000000000000000000000000000";
    const copperPriceFeedAddress = "0x0000000000000000000000000000000000000000";

    const CommodityBackedStablecoin = await ethers.getContractFactory("CommodityBackedStablecoin");
    const stablecoin = await CommodityBackedStablecoin.deploy(
        goldPriceFeedAddress,
        silverPriceFeedAddress,
        copperPriceFeedAddress,
        deployer.address
    );

    console.log("CommodityBackedStablecoin deployed to:", stablecoin.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
