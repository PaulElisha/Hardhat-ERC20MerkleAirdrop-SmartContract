// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "hardhat/console.sol";

contract merkleAirdrop is ERC20 {
    bytes32 public immutable root;
    uint256 public immutable rewardAmount;
    mapping(address => bool) tokenClaimed;

    constructor(bytes32 _root, uint256 _rewardAmount)ERC20("AirDrop", "AD") {
        root = _root;
        rewardAmount = _rewardAmount;
    }

    function claim(bytes32[] calldata _proof) external {
        require(!tokenClaimed[msg.sender], "Already claimed air drop");
        tokenClaimed[msg.sender] = true;
        bytes32 _leaf = keccak256(abi.encodePacked(msg.sender));
        require(
            MerkleProof.verify(_proof, root, _leaf),
            "Incorrect merkle proof"
        );
        _mint(msg.sender, rewardAmount);
    }
}
