import "../contracts/merkleAirdrop.sol";

const merkleScript = async () => {
  const MerkleAirdrop = await ethers.getContractFactory("merkleAirdrop");
  const merkleairdrop = await MerkleAirdrop.deploy(tokenAddress);
  await merkleairdrop.deployed();

  console.log("merkle deployed to:", merkleairdrop.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
merkleScript()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
