// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/* 
1: Fixed Sum

Your Goal: Find the Sum
Create a pure, external function sum which takes a fixed size array of five unsigned integers.
Find the sum of the unsigned integers and return it as a uint.
 */

contract Contract {
    function sum(uint[5] memory nums) external pure returns (uint) {
        uint total = 0;
        for (uint i = 0; i < nums.length; i++) {
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
    function sum(uint[] memory nums) external pure returns (uint) {
        uint total = 0;
        for (uint i = 0; i < nums.length; i++) {
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

    function filterEven(uint[] memory nums) external {
        for (uint i = 0; i < nums.length; i++) {
            if ((nums[i] % 2) == 0) {
                evenNumbers.push(nums[i]);
            }
        }
    }
}

/* 
4: Filter to Memory

Your Goal: Filter Even Numbers
Create a pure, external function called filterEven which takes an dynamic size array of unsigned integers as its only argument.
Find all the even numbers and add them to a new array in memory. This array should contain only the even numbers.
Return this new array.
 Note: the return array should only be large enough to fit the even numbers inside. This means you'll need to figure out how many even numbers there are before instantiating the array.
 */

contract Contract4 {
    function filterEven(
        uint[] memory nums
    ) external pure returns (uint[] memory) {
        uint count = 0;
        for (uint i = 0; i < nums.length; i++) {
            if ((nums[i] % 2) == 0) {
                count++;
            }
        }

        uint[] memory evenNumbers = new uint[](count);
        uint index = 0;

        for (uint i = 0; i < nums.length; i++) {
            if ((nums[i] % 2) == 0) {
                evenNumbers[index] = nums[i];
                index++;
            }
        }

        return evenNumbers;
    }
}

/* 
5: Stack Club 1

 Your Goal: Add Members 
Create a dynamic sized array of addresses called members
Create an external function addMember which has a single parameter: an address for a new member. Add this address to the members array.
Create a public view function isMember that takes an address and returns a bool indicating whether the address is a member or not.
 */

contract StackClub {
    address[] members;

    function addMember(address newAddress) external {
        members.push(newAddress);
    }

    function isMember(address comapareAddress) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == comapareAddress) {
                return true;
                break;
            }
        }
        return false;
    }
}

/* 
6: Stack Club 2

Your Goal: Remove Members
Create a constructor which will add the deployer address as the first member of the stack club.
Create a removeLastMember function which will remove the last member added to the club.
 Function Security
Ensure that the removeLastMember function can only be called by an existing member
Ensure that addMember can only be called by an existing member
 */

contract StackClub2 {
    address[] members;

    constructor() {
        members.push(msg.sender);
    }

    function addMember(address newAddress) external onlyMembers {
        members.push(newAddress);
    }

    function isMember(address comapareAddress) public view returns (bool) {
        for (uint i = 0; i < members.length; i++) {
            if (members[i] == comapareAddress) {
                return true;
                break;
            }
        }
        return false;
    }

    function removeLastMember() external onlyMembers {
        members.pop();
    }

    modifier onlyMembers() {
        bool isAllowed = false;
        for (uint i = 0; i < members.length; i++) {
            if (msg.sender == members[i]) {
                isAllowed = true;
                break;
            }
        }
        if (isAllowed) {
            _;
        } else {
            revert("You are not allowed");
        }
    }
}
