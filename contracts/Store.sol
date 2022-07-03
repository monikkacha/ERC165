// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Store {
    uint8 public value;

    function setValue(uint8 _value) public {
        value = _value;
    }

    function getValue() public view returns (uint8) {
        return value;
    }
}
