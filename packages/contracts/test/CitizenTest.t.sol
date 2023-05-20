// // SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "forge-std/Test.sol";
import { MudV2Test } from "@latticexyz/std-contracts/src/test/MudV2Test.t.sol";
import { getKeysWithValue } from "@latticexyz/world/src/modules/keyswithvalue/getKeysWithValue.sol";

import { IWorld } from "../src/codegen/world/IWorld.sol";
import { Citizen, CitizenTableId } from "../src/codegen/Tables.sol";

contract CitizensTest is MudV2Test {
  IWorld public world;

  function setUp() public override {
    super.setUp();
    world = IWorld(worldAddress);
  }

  function testWorldExists() public {
    uint256 codeSize;
    address addr = worldAddress;
    assembly {
      codeSize := extcodesize(addr)
    }
    assertTrue(codeSize > 0);
  }

  // function testCounter() public {
  //   // Expect the counter to be 1 because it was incremented in the PostDeploy script.
  //   uint32 counter = Counter.get(world);
  //   assertEq(counter, 1);

  //   // Expect the counter to be 2 after calling increment.
  //   world.increment();
  //   counter = Counter.get(world);
  //   assertEq(counter, 2);
  // }

  function testAddCitizen() public {
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    vm.startBroadcast(deployerPrivateKey);
    // IWorld(worldAddress).addCitizen(vm.addr(deployerPrivateKey), 0, 0, 0, 0, "", "TEST_ROLE");

    address deployerAddress = vm.addr(deployerPrivateKey);

    string memory role = Citizen.getRoleAttestation(deployerAddress);
    vm.stopBroadcast();
    // assertEq(role, "TEST_ROLE");

  }
}
