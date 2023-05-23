// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

// pnpm mud test --forgeOptions="-vvv" 
import { console } from "forge-std/console.sol";

import "forge-std/Test.sol";
import { MudV2Test } from "@latticexyz/std-contracts/src/test/MudV2Test.t.sol";
import { IWorld } from "../src/codegen/world/IWorld.sol";
import { SupercitiesTokenTable } from "../src/codegen/Tables.sol";
import { SingletonKey } from "../src/systems/SupercitiesSystem.sol";

contract SupercitiesSystemTest is MudV2Test {
  IWorld world;
 
  function setUp() public override {
    super.setUp();
    world = IWorld(worldAddress);
  }
 
  function testSetAddress() public {
    world.setAddress(address(world));
    address retrievedAddress = world.retrieveAddress();
    // console.log("retrievedAddress: ", retrievedAddress);
    // console.log("world address: ", address(world));
    assertEq(retrievedAddress, address(world));
  }

  function testSingltonKey() public {
    bytes32 key = SingletonKey;
    // console.logBytes32(key);
    world.setAddress(address(world));
    address retrievedAddress = SupercitiesTokenTable.get(world, key);
    // console.log(retrievedAddress);
    assertEq(retrievedAddress, address(world));
  }
}