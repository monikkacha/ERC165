// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

interface StoreReaderInterface {
    function setValue(uint8) external;

    function getValue() external view returns (uint8);

    function getSecondValue() external view returns (uint8);
}
