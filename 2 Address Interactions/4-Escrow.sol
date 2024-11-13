// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/* 
 Your Goal: Addresses
Create three public storage variables for the addresses of the depositor, beneficiary and arbiter.

Your Goal: Store Addresses
Create a constructor which takes two arguments: an address for the arbiter and an address for the beneficiary (in that order). Store these variables in the corresponding state variables.
The depositor is the address deploying the contract, so take this address and store it in the depositor state variable.
 */

 contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    constructor(address _arbiter, address _beneficiary){
        depositor = msg.sender;
        beneficiary = _beneficiary;
        arbiter = _arbiter;
    }
}