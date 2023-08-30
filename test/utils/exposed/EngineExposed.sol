// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity 0.8.18;

import {Engine, MathLib} from "src/Engine.sol";

contract EngineExposed is Engine {
    using MathLib for uint256;

    constructor(
        address _perpsMarketProxy,
        address _spotMarketProxy,
        address _sUSDProxy,
        address _oracle
    ) Engine(_perpsMarketProxy, _spotMarketProxy, _sUSDProxy, _oracle) {}

    function updateAccountStats(uint128 accountId, uint256 fees, uint128 volume)
        public
    {
        _updateAccountStats(accountId, fees.castU128(), volume);
    }

    function getSynthAddress(uint128 synthMarketId)
        public
        view
        returns (address)
    {
        return _getSynthAddress(synthMarketId);
    }
}
