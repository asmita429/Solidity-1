// Get funds from users
// Withdrawal fundss
// Set a min funding value in USD

// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 < 0.9.0;

// import "./AggregatorV3Interface.sol";
// or 
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{

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
        require(getConversionRate(msg.value) >= minimumUSD, "didn't send enough");

        // tracking funders with their address mapped with amount
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function getPrice() public view returns(uint256){
        // ABI
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        // (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound) = priceFeed.latestRoundData();

        (,int256 price,,,) = priceFeed.latestRoundData();
        // ETH in terms of USD
        // 3000000
        return uint256(price * 1e10); //1 ** 10 == 10000000000 
    }

    function getVersion() public view returns(uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getConversionRate(uint ethAmount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/1e18;
        return ethAmountInUsd;

    }
    // function withdraw(){}
}