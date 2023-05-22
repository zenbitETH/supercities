// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
 
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
 
  // function testAddEntry() public {
  //   // Add a new entry to the Dog via the system
  //   // this will call the addEntry function on MySystem
  //   bytes32 key = World.addEntry("bob", "blue");
  //   // Expect the value retrieved from the Dog at the corresponding key to match "bob" and "blue"
  //   string memory name = Dog.getName(world, key);
  //   string memory color = Dog.getColor(world, key);
  //   assertEq(name, "bob");
  //   assertEq(color, "blue");
  // }

  // function testSetAddress() public {
  //   world.setAddress(address(world));
  //   address retrievedAddress = world.retrieveAddress();
  //   console.log("retrievedAddress: ", retrievedAddress);
  //   console.log("world address: ", address(world));
  //   assertEq(retrievedAddress, address(world));
  // }
  
}