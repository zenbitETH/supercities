// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { Script } from "forge-std/Script.sol";
import { console } from "forge-std/console.sol";
import { IWorld } from "../src/codegen/world/IWorld.sol";
import { ERC20 } from "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { IERC20 } from "../node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol";
import { SupercitiesToken } from "../src/SupercitiesToken.sol";

import { SupercitiesSystem } from "../src/systems/SupercitiesSystem.sol";
import { SupercitiesTokenTable } from "../src/codegen/Tables.sol";



contract PostDeploy is Script {
  function run(address worldAddress) external {
    // Load the private key from the `PRIVATE_KEY` environment variable (in .env)
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

    // Start broadcasting transactions from the deployer account
    vm.startBroadcast(deployerPrivateKey);

    SupercitiesToken supercitiesToken = new SupercitiesToken(worldAddress);
    console.log("supercitiesToken: ", address(supercitiesToken));
    console.log("worldAddress: ", address(worldAddress));

    address scAddress = address(supercitiesToken);

    IWorld(worldAddress).setAddress(scAddress);
    address supercitiesAddress = IWorld(worldAddress).retrieveAddress();
    console.log("retrieved address:", supercitiesAddress);


    string memory name = IWorld(worldAddress).retrieveName();
    console.log("name: ", name);


    IWorld(worldAddress).mintTokens(worldAddress, 1*10**18);

    uint256 balance = SupercitiesToken(scAddress).balanceOf(worldAddress);
    console.log("balance: ", balance);


    vm.stopBroadcast();
  }
}