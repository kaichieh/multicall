// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
//https://emn178.github.io/online-tools/keccak_256.html
contract MultiCall {

    uint256 number;
    address private owner;

    function multiStaticcall(address[] calldata targets, bytes[] calldata data)
        external
        view
        returns (bytes[] memory)
    {
        require(targets.length == data.length, "target length != data length");

        bytes[] memory results = new bytes[](data.length);

        for (uint256 i; i < targets.length; i++) {
            (bool success, bytes memory result) = targets[i].staticcall(
                data[i]
            );
            require(success, "call failed");
            results[i] = result;
        }

        return results;
    }

    function multiCall(address[] calldata targets, bytes[] calldata data)
        external
        returns (bytes[] memory)
    {
        require(targets.length == data.length, "target length != data length");

        bytes[] memory results = new bytes[](data.length);

        for (uint256 i; i < targets.length; i++) {
            (bool success, bytes memory result) = targets[i].call(data[i]);
            require(success, "call failed");
            results[i] = result;
        }

        return results;
    }

    function multiDelegatecall(address[] calldata targets, bytes[] calldata data)
        external
        returns (bytes[] memory)
    {
        require(targets.length == data.length, "target length != data length");

        bytes[] memory results = new bytes[](data.length);

        for (uint256 i; i < targets.length; i++) {
            (bool success, bytes memory result) = targets[i].delegatecall(data[i]);
            require(success, "call failed");
            results[i] = result;
        }

        return results;
    }

    function getStaticNumber() public view returns (uint256){
        return 1
    }
}
