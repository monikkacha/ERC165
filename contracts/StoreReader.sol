// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "./StoreReaderInterface.sol";
import "./StoreInterfaceId.sol";
import "./ERC165.sol";
import "./ERC165Query.sol";

contract StoreReader is StoreInterfaceId, ERC165Query {
    StoreReaderInterface private storeInterface;

    constructor(address store) {
        require(
            doesContractImplementInterface(store, INTERFACE_ID_4),
            "Contract does not support interface"
        );
        storeInterface = StoreReaderInterface(store);
    }

    function readStoreValue() public view returns (uint8) {
        return storeInterface.getValue();
    }

    function readSecondStoreValue(address store) public view returns (uint8) {
        if (ERC165(store).supportsInterface(INTERFACE_ID_3)) {
            uint8 value = storeInterface.getSecondValue();
            return value;
        }
        revert("Doesnt support readSecondStoreValue");
    }
}
