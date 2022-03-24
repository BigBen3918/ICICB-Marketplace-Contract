const { task } = require("hardhat/config");

const getAccount = async () => {
    var [owner] = await ethers.getSigners();
    return owner;
}
task("check-balance", "Prints out the balance of your account").setAction(async function (taskArguments, hre) {
    const account = await getAccount();
    console.log(`Account balance for ${account.address}: ${await account.getBalance()}`);
});

task("deploy-NFT", "deploy new NFT contract")
    .addParam("name", "NFT name", "test NFT",types.String,true)
    .addParam("symbol", "NFT symbol", "tNFT",types.String,true)
    .setAction(async (taskArguments, hre) => {
        const NFT_ = await hre.ethers.getContractFactory("NFT");
        const NFT = await NFT_.deploy(taskArguments.name, taskArguments.symbol);
        await NFT.deployed();
        console.log(`${taskArguments.name} is deployed for address ${NFT.address}`)
    })