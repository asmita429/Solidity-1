// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

// either copy paste SimpleStorage.sol or import it. both will work 
import"./SimpleStorage.sol";


// deploying contract from within another contract
contract StorageFactory{
    //creating a global variable of type SimpleStorage
    // SimpleStorage public simplestorage; 
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();  //deploying SimpleStorage
        simpleStorageArray.push(simpleStorage);
    }

    function sfStorage(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        //Address
        // ABI: Application Binary Interface

        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.Store(_simpleStorageNumber);
    }

    function sfGet(uint _simpleStorageIndex) public view returns(uint256){
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        return simpleStorage.Retrieve();
    }
}