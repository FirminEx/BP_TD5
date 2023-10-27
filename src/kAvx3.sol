// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./IExerciceSolution.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract kAvx3 is IExerciceSolution, ERC20 {
  address admin;
  mapping(address => bool) public whiteList;
  mapping(address => uint256) public tierList;

  fallback() external payable {}

  receive() external payable {}

  constructor(
        string memory name,
        string memory ticker,
        uint supply
    ) ERC20(name, ticker) {
        _mint(address(this), supply);
        admin = msg.sender;
    }

  function symbol() override(IExerciceSolution, ERC20) public view returns (string memory) {
    return ERC20.symbol();
  }
    
  function getToken() override public returns (bool) {
    require(whiteList[msg.sender], "White-listed only");

    _mint(msg.sender, 1);
  }

  function addToWhiteList(address target) public {
    require(admin == msg.sender, "Admin only");

    whiteList[target] = true;
  }

  function buyToken() override public payable returns (bool) {
    // require(tierList[msg.sender] > 0, "Should be listed");

    _mint(msg.sender, msg.value);

    return true;
  }

  function isCustomerWhiteListed(address customerAddress) view override public returns (bool) {
    return whiteList[customerAddress];
  }

  function customerTierLevel(address customerAddress) view override public returns (uint256) {
    return tierList[customerAddress];
  }

  function addTier(address customerAddress, uint256 level) public {
    require(admin == msg.sender, "Admin only");

    tierList[customerAddress] = level;
  }
}