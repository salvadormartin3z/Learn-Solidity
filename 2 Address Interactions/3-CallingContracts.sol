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