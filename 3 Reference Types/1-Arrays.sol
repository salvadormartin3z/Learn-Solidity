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