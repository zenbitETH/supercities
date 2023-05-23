// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
 
// pnpm mud test --forgeOptions="-vvv" 
import { console } from "forge-std/console.sol";

import "forge-std/Test.sol";
import { MudV2Test } from "@latticexyz/std-contracts/src/test/MudV2Test.t.sol";
import { IWorld } from "../src/codegen/world/IWorld.sol";

import { Citizens } from "../src/codegen/Tables.sol";
 
contract CitizensSystemTest is MudV2Test {
  IWorld world;
 
  function setUp() public override {
    super.setUp();
    world = IWorld(worldAddress);
  }

  function testAddCitizen() public {
    world.addCitizen("testName");
    string memory name = Citizens.getName(world,0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496);
    // console.log(name);
    assertEq(name, "testName");
  }
}