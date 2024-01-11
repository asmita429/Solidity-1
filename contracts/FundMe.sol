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
    address public owner;

    constructor(){
        owner = msg.sender;
    }
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
        addressToAmountFunded[msg.sender] += msg.value;
    }

    
    function withdraw() public onlyOwner{
        // for loop [a, b, c, d]
        //           0. 1. 2. 3.
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) 
        {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;

        }
        // reset the array
        funders = new address[](0);
        // actually withdraw the money

        // // transfer
        // payable(msg.sender).transfer(address(this).balance);
        // // send
        // bool sendSuccess = payable (msg.sender).send(address(this).balance);
        // require(sendSuccess, "send failed"); 
        
        // call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, " call failed");
    }

    modifier onlyOwner{
        require(msg.sender == owner, "sender is not owner");
        _;

    }
}