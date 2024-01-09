// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0; 
// <- this section is a comment in solidity

contract SimpleStorage{ //similar to class class_name

// boolean, uint, int, address, bytes

    // bool hasFavouriteNumber = false;
    // uint256 hasFavouriteNumber = 123;
    // int hasFavouriteNumber = 123;
    // bytes hasFavouriteNumber = "cat";

    // this gets initialized to zero
    uint public favoriteNumber;
    // People public person = People({favoriteNumber:5, name: "Patrik"});

// mapping
    mapping(string => uint256) public nameToFavoriteNumber;

    // index starts at 0 for struct. similarly for uint public favouriteNumber index is 0, we can see it on Deployed Contracts list
    struct People{
        uint favoriteNumber;
        string name;
    }

    // uint256[] public favoriteNumberList;
    // dynamic array -> array[]; size of array is not given at the array initialization.
    People[] public people;


    function Store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
// if we do more stuffs it is gonna cost more gas
        // favoriteNumber = favoriteNumber + 1;
    }


// view & pure 
    // view or pure funtion does not cost gas. Cost only applies when called by a contract.
    // view function means we are just going to read the state, disallows modification of the state
    // pure function disallows reading the state or any modification of state. we can implement algorithm that actually does not need to be read, with pure function
    function Retrieve() public view returns(uint256){
        return favoriteNumber;
    }


    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        // people.push(newPerson);
        // _name = "cat"; memory is temporary variable that can be modified
        people.push(People(_favoriteNumber, _name));

// Mappings
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

// Errors & Warnings
    // Errors: when sign is red, it's broken. Warning: when sign is yellow. Listen to warning because warning gives insigthful information about how to improve your smart contracts


// calldata, memory, storage
    // EVM can access and store information in six places: stack, memory, storage, calldata, code, logs.
    // calldata(can't be modified) and memory(can be modified) mean the variable is only going to exist temporarily
    // other than calldata & memory keyword, they are storage by default





}  