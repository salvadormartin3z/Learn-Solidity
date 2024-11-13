// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/* 
1: Call Function

Your Goal: Alert Hero
Use the IHero interface and the hero address passed into sendAlert to alert the hero from the Sidekick contract.
 */

 interface IHero {
    function alert() external;
}

contract Sidekick {
    function sendAlert(address hero) external {
        // TODO: alert the hero using the IHero interface
        IHero(hero).alert();
    }
}

/* 
2: Signature

Your Goal: Alert Hero, Manually
Alert the Hero, manually this time!

Fill in the function signature for the Hero's alert function. Notice that we are taking the first 4 bytes of the hash of this function and passing it in as calldata to the hero.
 */

 contract Sidekick2 {
    function sendAlert(address hero) external {
        // TODO: fill in the function signature in the ""
        bytes4 signature = bytes4(keccak256("alert()"));

        (bool success, ) = hero.call(abi.encodePacked(signature));

        require(success);
    }
}

/* 
3: With Signature

Your Goal: Alert the Hero with Arguments
Alert the Hero by calling alert and passing the number of enemies and whether or not they are armed 

 Be careful! The type uint is an alias for uint256 but only uint256 will work with abi.encodeWithSignature.
 */

 contract Sidekick3 {
    function sendAlert(address hero, uint enemies, bool armed) external {
        (bool success, ) = hero.call(
            /* TODO: alert the hero with the proper calldata! */
            abi.encodeWithSignature("alert(uint256,bool)", enemies, armed)
        );

        require(success);
    }
}


/* 
Your Goal: Pass Calldata
The Sidekick needs to be able to relay any calldata along to the Hero. Update the relay function to take the data and send it to the Hero as calldata.

 */
contract Sidekick4 {
    function relay(address hero, bytes memory data) external {
        // Using the low-level call to send the data to the Hero contract
        (bool success, ) = hero.call(data);
        
        // Check if the call was successful
        require(success, "Call to Hero failed");
    }
}


/* 
our Goal: Trigger the fallback
In the makeContact method, send some calldata to the Hero contract that will trigger its fallback function.
 */

 contract Sidekick5 {
    function makeContact(address hero) external {
        // TODO: trigger the hero's fallback function!
        (bool succes, ) = hero.call("");
        require(succes, "Fallback");
    }
}