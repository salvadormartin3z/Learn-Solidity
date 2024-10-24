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