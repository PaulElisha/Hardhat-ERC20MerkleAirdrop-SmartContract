const { ethers } = require("hardhat");
async function main() {
    const TokenContract = await ethers.getContractFactory("MerkleToken");
    const tokencontract = await TokenContract.deploy();
    await tokencontract.deployed();
    console.log("token address", tokencontract.address);
}
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});