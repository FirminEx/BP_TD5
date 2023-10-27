// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {kAvx3} from "../src/kAvx3.sol";

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(privateKey);
        kAvx3 myContract = new kAvx3('-NTqc', '-NTqc', 906541972000000000000000000);
        vm.stopBroadcast();
    }
}
