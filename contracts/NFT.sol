// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.0;

import "./utils/access/Ownable.sol";
import "./ERC721/ERC721.sol";
import "./ERC20/IERC20.sol";

contract NFT is Ownable, ERC721 {
    /* --------------- tokenInfos --------------- */

    uint256 private _totalSupply;
    mapping(uint256 => string) tokenURIs;

    constructor(string memory _name, string memory _symbol)
        Ownable()
        ERC721(_name, _symbol)
    {
        _totalSupply = 0;
    }

    function create(string calldata _tokenURI) external {
        _create(msg.sender, _tokenURI);
    }

    function _create(address _owner, string calldata _tokenURI)
        internal
        returns (uint256 tokenId)
    {
        tokenId = _totalSupply;
        _totalSupply = _totalSupply + 1;

        /// Mint new NFT
        _mint(_owner, tokenId);
        tokenURIs[tokenId] = _tokenURI;
    }

    function tokenURI(uint256 tokenId) external view returns (string memory) {
        require(tokenId < _totalSupply);
        return tokenURIs[tokenId];
    }

    function totalSupply() external view returns (uint256) {
        return _totalSupply;
    }
}
