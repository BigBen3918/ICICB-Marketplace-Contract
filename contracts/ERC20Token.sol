// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.0;
import "./ERC20/ERC20.sol";

contract ERC20Token is ERC20 {
    constructor(
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 totalSupply_
    ) ERC20(name_, symbol_) {
        _mint(msg.sender, totalSupply_);
        _decimals = decimals_;
    }
}
