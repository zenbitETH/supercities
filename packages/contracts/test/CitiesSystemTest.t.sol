// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
 
import "forge-std/Test.sol";
import { MudV2Test } from "@latticexyz/std-contracts/src/test/MudV2Test.t.sol";
import { IWorld } from "../src/codegen/world/IWorld.sol";

import { Cities, Citizens } from "../src/codegen/Tables.sol";
 
contract CitiesSystemTest is MudV2Test {
  IWorld world;
 
  function setUp() public override {
    super.setUp();
    world = IWorld(worldAddress);
  }
 
  function testProposeCity() public {
    world.addCitizen("testName");
    // uint256 citizenId = Citizens.getCitizenId(world,0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496);
    // console.log(citizenId);

    world.proposeCity("testCity", "testCountry");
    string memory city = Cities.getCity(world, 1);
    // assertEq(city, "testCity");
    // Not retrieving data--why?
    console.log(city);
  }

  


}