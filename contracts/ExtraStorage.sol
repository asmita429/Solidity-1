// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

import "./SimpleStorage.sol";

//inheritance
contract ExtraStorage is SimpleStorage{
    // + 5
    // override
    //virtual override

    function Store(uint _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}