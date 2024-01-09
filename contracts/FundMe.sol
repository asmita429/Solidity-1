// Get funds from users
// Withdrawal fundss
// Set a min funding value in USD

// SPDX-License-Identifier: MIT

pragma solidity >=0.6.12 < 0.9.0;

contract FundMe{
    
    function fund() public payable {
        // want to be able to set a minimun fund amount in USD
        // how can we send ETH to this contract?

        require(msg.value > 1e18,"Didn't send enough!"); // 1e18 = 1* 10 ** 18 = 1000000000000000000
        //What is reverting? => undo any action before, and send remaining gas back
    }

    // function withdraw(){}
}