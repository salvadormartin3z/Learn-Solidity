// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/* 
1: Storing Owner

Your Goal: Store the Owner
Create a public address state variable called owner on the contract
Next create a constructor function which will store the msg.sender in owner

---------------------- 2: Receive Ether

Your Goal: Receive Ether
Add a function to the contract that will allow it to receive ether on a transaction without any calldata.

---------------------- 3: Tip Owner

Your Goal: Transfer Tips
Let's create a way to tip the contract owner!

Create a public payable function tip which sends any of its received ether to the owner.

---------------------- 4: Charity

Your Goal: Charity Donation
Let's take all funds that were passed to the receive function and donate them to charity. We'll do this in two steps.

First, modify the constructor to accept a new argument: the charity address.
Next, add a new function called donate. When this function is called transfer all remaining funds in the contract to the charity address.

---------------------- 5: Self Destruct

Your Goal: Self Destruct
When the donate function is called, trigger a selfdestruct in the contract!
 */

 
contract Contract {
    address public owner;
    address public charity;

    constructor(address _charity){
        owner = msg.sender;
        charity = _charity;
    }

    receive() external payable{
    }

    function tip() public payable{
        (bool s,) = owner.call{ value: msg.value }("");
        require(s);
    }

    function donate() public payable{
        (bool s,) = charity.call{ value: address(this).balance }("");
        require(s);
        selfdestruct(payable(charity));
    }

}