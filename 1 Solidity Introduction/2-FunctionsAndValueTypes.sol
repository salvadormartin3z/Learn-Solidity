// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/* 
1: Arguments

Your Goal: Unsigned Int Constructor
Create a constructor which will take a uint as an argument.
Store this uint value inside a public storage variable called x.

---------------------- 2: Increment

Your Goal: Increment x
Let's build on your code from the previous stage!

Create an external function called increment that will add 1 to the state variable x.

---------------------- 3: View Addition

Your Goal: Add Uint
Create an external view function add which takes a uint parameter and returns the sum of the parameter plus the state variable x.
 */

 contract Contract {
    uint public x;

    constructor(uint _x){
        x = _x;
    }

    function increment() external{
        x += 1;
    }

    function add(uint _y) external view returns(uint){
        return x + _y;
    }

}

/* 
4: Console Log

Your Goal: Return the Secret
There is a message being passed to you in the winningNumber function. You can use console.log to display this message to the console. It will tell you what to do from there!
 */

 import "forge-std/console.sol";

contract Contract2 {
    function winningNumber(string calldata secretMessage) external returns(uint) {
        console.log(secretMessage);
        return 794;
    }
}
