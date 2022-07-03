// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "./StoreReaderInterface.sol";
import "./StoreInterfaceId.sol";
import "./ERC165.sol";

contract StoreReader is StoreInterfaceId {
    function readStoreValue(address store) public view returns (uint8) {
        if (ERC165(store).supportsInterface(INTERFACE_ID_2)) {
            StoreReaderInterface storeInterface = StoreReaderInterface(store);
            uint8 value = storeInterface.getValue();
            return value;
        }
        revert("Doesnt support StoreInterface");
    }

    function readSecondStoreValue(address store) public view returns (uint8) {
        if (ERC165(store).supportsInterface(INTERFACE_ID_3)) {
            StoreReaderInterface storeInterface = StoreReaderInterface(store);
            uint8 value = storeInterface.getSecondValue();
            return value;
        }
        revert("Doesnt support readSecondStoreValue");
    }
}
