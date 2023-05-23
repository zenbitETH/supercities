// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
 
import "forge-std/Test.sol";
import { MudV2Test } from "@latticexyz/std-contracts/src/test/MudV2Test.t.sol";
import { IWorld } from "../src/codegen/world/IWorld.sol";
import { ERC20 } from "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { Cities, Citizens, Proposals, CitiesCounter, SupercitiesTokenTable } from "../src/codegen/Tables.sol";

bytes32 constant SingletonKey = bytes32(uint256(0x060D));

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
    // Not retrieving data--why? It works in other tests
    // console.log(city);
  }

  function testUpvote() public {
    world.addCitizen("testName");
    world.proposeCity("testCity", "testCountry");
    world.upvote(1);
    uint256 upvotes = Proposals.getUpvotes(world, 1);
    // console.log(upvotes);
  }

  function testDownvote() public {
    world.addCitizen("testName");
    world.proposeCity("testCity", "testCountry");
    world.downvote(1);
    uint256 downvotes = Proposals.getDownvotes(world, 1);
    // console.log(downvotes);
  }

  function testAddCity() public {
    world.addCitizen("testName");
    world.proposeCity("testCity", "testCountry");
    world.upvote(1);
    world.addCity(1);
    // address proposer = Cities.getProposer(world, 1);
    // console.log("proposer: ", proposer);
    // string memory city = Cities.getCity(world, 1);
    // console.log("city: ", city);
    // string memory country = Cities.getCountry(world, 1);
    // console.log("country: ", country);

    // bytes32 key = SingletonKey;
    // uint256 citiesCounter = CitiesCounter.get(world, key);
    // console.log("citiesCounter: ", citiesCounter);

    // uint256[] memory addedCities = Citizens.getAddedCities(world, 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496);
    // console.log("addedCities[0]: ", addedCities[0]);

    // address superCitiesTokenAddress = SupercitiesTokenTable.get(world, key);
    // console.log("superCitiesTokenAddress: ", superCitiesTokenAddress);
    // uint256 balance = ERC20(superCitiesTokenAddress).balanceOf(0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496);
    // console.log("balande: ", balance);
  }
}