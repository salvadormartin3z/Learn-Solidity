// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
1: Booleans

Your Goal: Add two boolean variables
Create two public boolean storage variables on the contract: a and b.

Store true in the variable a and false in the value b.
*/

contract Contract {
    bool public a = true;
    bool public b = false;
}

/*
2: Unsigned Integers

Your Goal: Create Unsigned Integers!
Let's create three public storage unsigned integers in our Contract: a, b, and sum.

Define the variable a as an uint8 with an initial value between 0 and 255.

Define the variable b as an uint16 with a value of at least 256.

The variable sum should be a uint256 with the sum of the values stored in a and b.
 */

 contract Contract2 {
    uint8 public a = 2;
    uint16 public b = 256;
    uint256 public sum = a + b;
}