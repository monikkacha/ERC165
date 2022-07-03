// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./StoreReaderInterface.sol";

contract Selector {
    function calcStoreInterfaceIdFor2() external pure returns (bytes4) {
        StoreReaderInterface i;
        return i.getValue.selector ^ i.setValue.selector;
    }

    function calcStoreInterfaceIdFor3() external pure returns (bytes4) {
        StoreReaderInterface i;
        return
            i.getValue.selector ^
            i.setValue.selector ^
            i.getSecondValue.selector;
    }
}
