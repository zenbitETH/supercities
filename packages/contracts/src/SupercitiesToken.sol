// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { ERC20 } from "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { IERC20 } from "../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SupercitiesToken is ERC20 {
  constructor() ERC20("SupercitiesToken", "SPCT") {}
}