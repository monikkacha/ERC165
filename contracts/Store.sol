// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./ERC165.sol";
import "./StoreInterfaceId.sol";

contract Store is ERC165, StoreInterfaceId {
    uint8 public value;

    function setValue(uint8 _value) public {
        value = _value;
    }

    function getValue() public view returns (uint8) {
        return value;
    }

    function supportsInterface(bytes4 interfaceID)
        external
        pure
        override
        returns (bool)
    {
        return interfaceID == INTERFACE_ID_2 || interfaceID == INTERFACE_ID_4;
    }
}
