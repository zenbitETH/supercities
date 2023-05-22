// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { ERC20 } from "../../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

import { System } from "@latticexyz/world/src/System.sol";
import { SupercitiesTokenTable } from "../codegen/Tables.sol";

import { SupercitiesToken } from "../SupercitiesToken.sol";

bytes32 constant SingletonKey = bytes32(uint256(0x060D));

contract SupercitiesSystem is System {
  function setAddress(address _scAddress) public {
    bytes32 key = SingletonKey;
    SupercitiesTokenTable.set(key, _scAddress);
  }

  function retrieveAddress() public returns (address) {
    bytes32 key = SingletonKey;
    address supercitiesAddress = SupercitiesTokenTable.get(key);
    return supercitiesAddress;
  }
}