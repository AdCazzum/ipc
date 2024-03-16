// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Willow.sol";

contract Demo {
    function foo() public {
        WillowIPC.execute("https://ipfs.io/ipfs/Qmbi6GYikeZYxdNWsLsZY75xgB9Uuy55zZdMT2hedCxGSr");
    }
}