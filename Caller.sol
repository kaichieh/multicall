// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Caller {

    uint256 number;
    address private owner;

    // 0x67e404ce
    function sender() public view returns (address){
        return msg.sender;
    }

    // 0x13af4035
    // ["0x13af40350000000000000000000000005b38da6a701c568545dcfcb03fcb875f56beddc4"]
    function setOwner(address newOwner) public{
        owner = newOwner;
    }

    //0x893d20e8
    function getOwner() public view returns (address) {
        return owner;
    }

    //0x6057361d
    //["0x6057361d0000000000000000000000000000000000000000000000000000000011e17429"]
    function store(uint256 num) public {
        number = num;
    }

    //0x915eef40
    //["0x915eef400000000000000000000000000000000000000000000000000000000011e17429"]
    function storeOwner(uint256 num) public {
        require(msg.sender == owner, "Caller is not owner");
        number = num;
    }

    // 0x6d4ce63c
    function get() public view returns (uint256){
        return number;
    }

    function getStaticNumber() public view returns (uint256){
        return 2
    }
