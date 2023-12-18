// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MerkleToken is ERC20 {
    constructor() ERC20("MerkleToken", "MKT"){
        _mint(msg.sender, 10000e18);
    }
}