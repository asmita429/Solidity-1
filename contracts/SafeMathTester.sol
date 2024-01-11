// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// old course...
contract SafeMathTester{
    uint public bigNumber = 255; //above 0.8.0 version, //checked: automatically increases bigNum = 255 + 1 = 256
    // below 0.8.0 version
    //unchecked: adding number to bigNum will be wrapped automatically after it reaches 255. means 255+1 = 0

    function add() public {
       unchecked{bigNumber = bigNumber + 1;}
    }
}