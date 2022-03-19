// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SunCoin is ERC20 {

    uint costOfToken = 1000;
    uint _totalSupply = 0;
    mapping(address => uint256) balances;
    constructor() ERC20("SunCoin", "SCN") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function buyToken(address receiver) public payable {
        require(msg.value > 0);

        uint boughtToken = (msg.value / 10 ** decimals()) * costOfToken;

        balances[receiver] += boughtToken; 

        _totalSupply += boughtToken;

    }

}