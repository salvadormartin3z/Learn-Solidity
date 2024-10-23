// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/* 
1: Constructor Revert

Your Goal: Require 1 Ether
Add a payable constructor method that requires a 1 ether deposit.

If at least 1 ether is not sent to the constructor, revert the transaction.

---------------------- 2: Only Owner

Your Goal: Owner Withdrawal
Create a public function withdraw that will withdraw all funds from the contract and send them to the deployer of the contract.

Require that only the deployer of the contract be allowed to call this function. For all other addresses, this function should revert.
 */

 contract Contract {
    address developer;

    constructor() payable {
        if(address(this).balance < 1 ether){
            revert("No enough");
        }

        developer = msg.sender;
    }

    function withdraw() external{
        if(msg.sender == developer){
            (bool s,) = developer.call{value:address(this).balance}("");
            require(s);
        }else{
            revert("You are not the owner");
        }
        
    }
}

/* 
3: Owner Modifier

Your Goal: Require Owner
You'll notice that the onlyOwner modifier has been added to each of the configuration functions in this contract. Only problem is, it doesn't currently do anything!

Update the onlyOwner modifier to require that only the owner address can call these functions without reverting.
 */

 
contract Contract2 {
	uint configA;
	uint configB;
	uint configC;
	address owner;

	constructor() {
		owner = msg.sender;
	}

	function setA(uint _configA) public onlyOwner {
		configA = _configA;
	}

	function setB(uint _configB) public onlyOwner {
		configB = _configB;
	}

	function setC(uint _configC) public onlyOwner {
		configC = _configC;
	}

	modifier onlyOwner {
		// TODO: require only the owner access
		if(msg.sender == owner){
			_;
		}else{
			revert("You are not the owner");
		}

		// TODO: run the rest of the function body

	}
}
