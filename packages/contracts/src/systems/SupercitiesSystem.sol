// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { ERC20 } from "../../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { console } from "forge-std/console.sol";

import { System } from "@latticexyz/world/src/System.sol";
import { SupercitiesTokenTable } from "../codegen/Tables.sol";

import { SupercitiesToken } from "../SupercitiesToken.sol";

bytes32 constant SingletonKey = bytes32(uint256(0x060D));

contract SupercitiesSystem is System {
  function retrieveName() public returns (string memory name) {
    address supercitiesAddress = retrieveAddress();
    name = ERC20(supercitiesAddress).name();
  }

  function mintTokens(address _citizen, uint256 _amount) public {
    address supercitiesAddress = retrieveAddress();
    address SupercitiesTokenCaller = SupercitiesToken(supercitiesAddress).mint(_citizen, _amount);
    console.log("SupercitiesSystem caller: ", msg.sender);
    console.log("SupercitiesToken caller: ", SupercitiesTokenCaller);
  }


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