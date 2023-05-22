// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { console } from "forge-std/console.sol";
import { System } from "@latticexyz/world/src/System.sol";
import { Citizens, CitizensCounter, SupercitiesTokenTable, VerifiedCities } from "../codegen/Tables.sol";
import { SupercitiesToken } from "../SupercitiesToken.sol";

bytes32 constant SingletonKey = bytes32(uint256(0x060D));

contract CitizensSystem is System {
  error InvalidCitizen();
  error CitizenAlreadyExists();
  error CityAlreadyVerified();
  error CannotCommitToCity();
  error CannotClaimReward();
  error CitizenAlreadyVerifiedCity();
  error UnregisteredCitizen();

  // ---------------------------------- //
  //             Public                 //
  // ---------------------------------- //
  function addCitizen(
    string memory _name
  ) public {
    if (_msgSender() != address(0)) revert CitizenAlreadyExists();

    uint256 citizenId = _incrementCitizensCounter();
    uint256[] memory proposedCities = new uint256[](0);
    Citizens.set(_msgSender(), citizenId, 0, 0, 0, 0, _name, "", proposedCities);
  }

  function verifyCity(uint256 _cityId) public {
    if (VerifiedCities.get(_cityId, _msgSender())) revert CitizenAlreadyVerifiedCity();
    if (Citizens.getCitizenId(_msgSender()) < 1) revert UnregisteredCitizen();

    _incrementGamePoints(_msgSender());
    _incrementVerifiedCities(_msgSender());

    VerifiedCities.set(_cityId, _msgSender(), true);
  }

  function commitToCity(uint256 _cityId) public {
    if (Citizens.getCitizenId(_msgSender()) < 1) revert UnregisteredCitizen();
    // Level 0 citizens cannot change their committed city
    uint256 cityCommittedTo = Citizens.getCityCommittedTo(_msgSender());
    uint256 level = Citizens.getLevel(_msgSender());
    if (cityCommittedTo != 0 && level == 0) revert CannotCommitToCity();

    _incrementGamePoints(_msgSender());
    Citizens.setCityCommittedTo(_msgSender(), _cityId);
  }

  function claimReward(address _citizen) public {
    if (_msgSender() != _citizen) revert InvalidCitizen();

    uint256 level = Citizens.getLevel(_citizen);
    if (level == 0) revert CannotClaimReward();
    
    // Check citizen token balance
    // Transfer tokens to citizen
    // Check that user balance increased by at least the number of tokens due to them

    Citizens.setGamePoints(_citizen, 0);
  }


  // ---------------------------------- //
  //             Internal               //
  // ---------------------------------- //
  function _incrementGamePoints(address _citizen) internal {
    uint256 gamePoints = Citizens.getGamePoints(_citizen);
    uint256 newGamePoints = gamePoints++;
    Citizens.setGamePoints(_citizen, newGamePoints);
  }

  function _incrementVerifiedCities(address _citizen) internal {
    uint256 verifiedCities = Citizens.getVerifiedCities(_citizen);
    uint256 newVerifiedCities = verifiedCities++;
    Citizens.setVerifiedCities(_citizen, newVerifiedCities);
  }

  function _incrementCitizensCounter() internal returns (uint256) {
    uint256 counter = CitizensCounter.get();
    uint256 newValue = counter + 1;
    CitizensCounter.set(newValue);
    return newValue;
  }

  function _mintTokens(address _citizen, uint256 _amount) internal {
    bytes32 key = SingletonKey;
    address supercitiesAddress = SupercitiesTokenTable.get(key);
    address SupercitiesTokenCaller = SupercitiesToken(supercitiesAddress).mint(_citizen, _amount);
    console.log("SupercitiesSystem caller: ", msg.sender);
    console.log("SupercitiesToken caller: ", SupercitiesTokenCaller);
  }
}
