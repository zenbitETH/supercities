// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { ERC20 } from "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { console } from "forge-std/console.sol";

contract SupercitiesToken is ERC20 {
  address worldAddress;
  constructor(address _worldAddress) ERC20("SupercitiesToken", "SPCT") {
    worldAddress = _worldAddress;
  }

  modifier onlyworldAddress() {
    require(msg.sender == worldAddress, "SupercitiesToken: caller not worldAddress");
    _;
  }

  // This is deployed in PostDeploy
  function mint(address _citizen, uint256 _amount) public onlyworldAddress returns (address) {
    _mint(_citizen, _amount);
    return msg.sender;
  }
}