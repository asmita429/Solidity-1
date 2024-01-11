// Get funds from users
// Withdrawal fundss
// Set a min funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 < 0.9.0;

// import "./AggregatorV3Interface.sol";
// or 
// import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

import"./PriceConverter.sol";
contract FundMe{

    using PriceConverter for uint256;

    uint256 public minimumUSD = 50 * 1e18;

    // creating array of funders
    address[] public funders;

    // mapping address to value or amount
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable {
        // want to be able to set a minimun fund amount in USD
        // how can we send ETH to this contract?

        // require(msg.value > 1e18,"Didn't send enough!"); // 1e18 = 1* 10 ** 18 = 1000000000000000000
        //What is reverting? => undo any action before, and send remaining gas back

        // require(msg.value > minimumUSD, "Didn't send enough");

        // msg.value.getConversionRate();
        require(msg.value.getConversionRate() >= minimumUSD, "didn't send enough");

        // tracking funders with their address mapped with amount
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    
    // function withdraw(){}
}