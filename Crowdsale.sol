// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Token.sol";

contract Crowdsale {
    uint256 public rate = 200;

    Token public token;

    constructor(uint256 initialSupply) {
        token = new Token(initialSupply);
    }

    receive() external payable {
        require(msg.value >= 0.1 ether, "You can't send less than 0.1 ETH");
        sendTokens(msg.sender, msg.value);
    }

    function sendTokens(address _address, uint256 _amount) internal {
        uint256 tokensToSend = _amount * rate;

        token.transfer(_address, tokensToSend);
    }
}