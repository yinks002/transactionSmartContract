// SPDX-License-Identifier: GPL-3.0

// this is a smart contract that can be used to send ethereum to an address
// this is not a production ready code so i will not be responsible on any damage incured

// this code sets the solidity version
pragma solidity ^0.8.0;

// this code defines and names the smart contract
contract transactionSmartContract {
    // this code declares a state variable type of uint256 
    uint256 numberOfTransactions;

    // this code creates an event that accept certain parameters
    event Transfers(address from, address to, uint amount, string message, uint256 timestamp, string keyword);
    // the code creates a data type struct called Transfer
    struct Transfer {
        address sender;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }
    // this code creates an array of the Transfer class
    Transfer[] transactions;

    // this code is a function that accepts parameters from the user to send eth
    function addToBlockchain(address payable receiver, uint amount, string memory message, string memory keyword) public {
        
        // this code increments the numberofTransactions anytime the function is called 
        numberOfTransactions += 1;

        // this code collects the inputed parameters from the user and pushes it to the transactions array
        transactions.push(Transfer(msg.sender, receiver, amount, message, block.timestamp, keyword));

        // this code emits info with data from the user
        emit Transfers(msg.sender, receiver, amount, message, block.timestamp, keyword);
    }

    // this code is a funtion that is used to see all transactions
    function AllTransactions() public view returns (Transfer[] memory) {
        return transactions;
    }

    // this is a function that is used to see the number of all transactions
    function numbersOfTransactions() public view returns (uint256) {
        return numberOfTransactions;
    }
}