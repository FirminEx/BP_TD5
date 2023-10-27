// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./IExerciceSolution.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract kAvx3 is IExerciceSolution, ERC20 {
  constructor(string memory name, string memory symbol,uint256 initialSupply) ERC20(name, symbol) {
    _mint(msg.sender, 833247979000000000000000000);
  }

  function symbol() override(IExerciceSolution, ERC20) public view returns (string memory) {}
    
  function getToken() override public returns (bool) {}

  function buyToken() override public payable returns (bool) {}

  function isCustomerWhiteListed(address customerAddress) override public returns (bool) {}

  function customerTierLevel(address customerAddress) override public returns (uint256) {}
}