// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {ERC2771Context} from
    "lib/openzeppelin-contracts/contracts/metatx/ERC2771Context.sol";

contract MockCallee {}

contract MockCalleeWithContext is ERC2771Context {
    error Unsuccessful();

    constructor(address _trustedForwarder) ERC2771Context(_trustedForwarder) {}

    function thisMethodSucceeds() public pure {}

    function thisMethodReverts() public pure {
        revert Unsuccessful();
    }

    function sendBackValue(address target) public payable {
        (bool ok,) = target.call{value: msg.value}("");
        if (!ok) revert Unsuccessful();
    }

    function lockEth() public payable {
        // do nothing
    }
}
