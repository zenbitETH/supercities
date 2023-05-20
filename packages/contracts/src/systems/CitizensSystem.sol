// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { Citizens, CitizensCounter } from "../codegen/Tables.sol";

contract CitizensSystem is System {
  error InvalidCitizen();
  error CitizenAlreadyExists();
  error CityAlreadyVerified();
  error CannotCommitToCity();
  error CannotClaimReward();
  error InvalidVerifiedCities();
  error InvalidLevel();
  error InvalidGamePoints();
  error InvalidCityCommittedTo();

  // ---------------------------------- //
  //             Public                 //
  // ---------------------------------- //
  function addCitizen(
    address _citizen,
    uint256 _verifiedCities,
    uint256 _level,
    uint256 _gamePoints,
    uint256 _cityCommittedTo,
    string memory _name,
    string memory _roleAttestation
  ) public {
    if (_msgSender() != address(0)) revert CitizenAlreadyExists();
    if (_verifiedCities != 0) revert InvalidVerifiedCities();
    if (_level != 0) revert InvalidLevel();
    if (_gamePoints != 0) revert InvalidGamePoints();
    if (_cityCommittedTo != 0) revert InvalidCityCommittedTo();

    uint256 citizenId = incrementCitizensCounter();
    Citizens.set(_citizen, citizenId, _verifiedCities, _level, _gamePoints, _cityCommittedTo, _name, _roleAttestation);
  }

  function verifyCity(address _citizen, uint256 _cityId) public {
    if(_msgSender() != _citizen) revert InvalidCitizen();

    // NEED TO ADD A REQUIREMENT SO THAT A CITIZEN CANNOT VERIFY THE SAME CITY MORE THAN ONCE.  
    // Cities table:
    // mapping(uint256 cityId => mapping(address citizen => bool)) public hasCitizenVerifedCity
    //Requirement:
    // if (Cities.hasCitizenVerifiedCity(_citizen, _cityId)) CityAlreadyVerified();

    incrementGamePoints(_citizen);
    incrementVerifiedCities(_citizen);
    // Cities.setHasCitizenVerifiedCity(_citizen, _cityId) = true;
  }

  function commitToCity(address _citizen, uint256 _cityId) public {
    if (_msgSender() != _citizen) revert InvalidCitizen();
    // Level 0 citizens cannot change their committed city
    uint256 cityCommittedTo = Citizens.getCityCommittedTo(_citizen);
    uint256 level = Citizens.getLevel(_citizen);
    if (cityCommittedTo != 0 && level == 0) revert CannotCommitToCity();

    Citizens.setCityCommittedTo(_citizen, _cityId);
    incrementGamePoints(_citizen);
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
  function incrementGamePoints(address _citizen) internal {
    uint256 gamePoints = Citizens.getGamePoints(_citizen);
    uint256 newGamePoints = gamePoints++;
    Citizens.setGamePoints(_citizen, newGamePoints);
  }

  function incrementVerifiedCities(address _citizen) internal {
    uint256 verifiedCities = Citizens.getVerifiedCities(_citizen);
    uint256 newVerifiedCities = verifiedCities++;
    Citizens.setVerifiedCities(_citizen, newVerifiedCities);
  }

  function incrementCitizensCounter() public returns (uint256) {
    uint256 counter = CitizensCounter.get();
    uint256 newValue = counter + 1;
    CitizensCounter.set(newValue);
    return newValue;
  }
}
