// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/* 
 Your Goal: Addresses
Create three public storage variables for the addresses of the depositor, beneficiary and arbiter.

Your Goal: Store Addresses
Create a constructor which takes two arguments: an address for the arbiter and an address for the beneficiary (in that order). Store these variables in the corresponding state variables.
The depositor is the address deploying the contract, so take this address and store it in the depositor state variable.

Your Goal: Payable
Modify the constructor function to make it payable.

Your Goal: Approve
Create an external function called approve.
This function should move the contract's balance to the beneficiary's address.

Your Goal: Security
If anyone tries to call approve other than the arbiter address, revert the transaction.

Your Goal: Approved
Create an event called Approved which takes a single uint parameter: the balance that is sent to the beneficiary.

Emit this event from within the approve function.
 */

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    event Approved (uint amount);

    constructor(address _arbiter, address _beneficiary) payable {
        depositor = msg.sender;
        beneficiary = _beneficiary;
        arbiter = _arbiter;
    }

    function approve() external {
        require(msg.sender == arbiter, "You are not allowed");

        uint balance = address(this).balance;

        (bool success, ) = beneficiary.call{value: address(this).balance}("");
        require(success, "Something bad");

        emit Approved(balance);
    }
}
