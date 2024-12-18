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

/* 
5: Pure Double

Your Goal: Double Uint
Create an external, pure function called double which takes a uint parameter and doubles it. It should return this doubled uint value.

---------------------- 6: Double Overload

Your Goal: Overload Double
Create another pure external function double which takes two uint parameters.
Double both of the arguments and return both of them in the same order they were passed into the function.
 */

contract Contract3 {
    function double(uint _value) external pure returns(uint){
        return _value*2;
    }

    function double(uint _value1, uint _value2) external pure returns(uint,uint){
        return (_value1 * 2, _value2 * 2);
    }
}
