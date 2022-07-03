// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "./StoreReaderInterface.sol";

contract StoreReader {
    function readStoreValue(address store) public view returns (uint8) {
        StoreReaderInterface storeInterface = StoreReaderInterface(store);
        uint8 value = storeInterface.getValue();
        return value;
    }

    function readSecondStoreValue(address store) public view returns (uint8) {
        StoreReaderInterface storeInterface = StoreReaderInterface(store);
        uint8 value = storeInterface.getSecondValue();
        return value;
    }
}
