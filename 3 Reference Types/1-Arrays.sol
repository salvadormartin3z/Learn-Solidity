// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/* 
1: Fixed Sum

Your Goal: Find the Sum
Create a pure, external function sum which takes a fixed size array of five unsigned integers.
Find the sum of the unsigned integers and return it as a uint.
 */

 contract Contract {
    function sum(uint[5] memory nums ) external pure returns(uint){
        uint total = 0;
        for(uint i = 0; i < nums.length; i++){
            total += nums[i];
        }
        return total;
    }
}

/* 
2: Dynamic Sum

Your Goal: Sum Dynamic Array
Create a pure, external function sum which takes a dynamic size array of unsigned integers.
Find the sum of the unsigned integers and return it as a uint.
 */

 contract Contract2 {
    function sum(uint[] memory nums) external pure returns(uint){
        uint total = 0;
        for(uint i = 0; i < nums.length; i++){
            total += nums[i];
        }
        return total;
    }
}

/* 
3: Filter to Storage

Your Goal: Filter Even Numbers
Create a public, dynamic sized array of unsigned integers as a state variable called evenNumbers.
Create an external function called filterEven which takes an dynamic size array of unsigned integers as its only argument. Find all of the even numbers in this array and push them into the evenNumbers storage array.
 */

contract Contract3 {
    uint[] public evenNumbers;

    function filterEven(uint[] memory nums) external{
        for(uint i = 0; i < nums.length; i++){
            if((nums[i]%2) == 0){
                evenNumbers.push(nums[i]);
            }
        }
    }
}