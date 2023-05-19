// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { Citizen } from "../codegen/Tables.sol";

contract CitizensSystem is System {
  error InvalidCitizen();
  error CitizenAlreadyExists();
  error CityAlreadyVerified();
  error CannotCommitToCity();
  error CannotClaimReward();

  // ---------------------------------- //
  //             Public                 //
  // ---------------------------------- //
  function addCitizen(
    address _citizenId,
    string memory _name,
    uint256 _verifiedCities,
    string memory _roleAttestation,
    uint256 _level,
    uint256 _gamePoints,
    uint256 _cityCommittedTo
  ) public {
    if (_msgSender() != address(0)) CitizenAlreadyExists();

    Citizen.set(_citizenId, _name, _verifiedCities, _roleAttestation, _level, _gamePoints, _cityCommittedTo);
  }

  function verifyCity(address _citizenId, uint256 _cityId) public {
    if(_msgSender() != _citizenId) revert InvalidCitizen();

    // NEED TO ADD A REQUIREMENT SO THAT A CITIZEN CANNOT VERIFY THE SAME CITY MORE THAN ONCE.  
    // Cities table:
    // mapping(uint256 cityId => mapping(address citizenId => bool)) public hasCitizenVerifedCity
    //Requirement:
    // if (Cities.hasCitizenVerifiedCity(_citizenId, _cityId)) CityAlreadyVerified();

    incrementGamePoints(_citizenId);
    incrementVerifiedCities(_citizenId);
    // Cities.setHasCitizenVerifiedCity(_citizenId, _cityId) = true;
  }

  function commitToCity(address _citizenId, uint256 _cityId) public {
    if (_msgSender() != _citizenId) revert InvalidCitizen();
    // Level 0 citizens cannot change their committed city
    uint256 cityCommittedTo = Citizen.getCityCommittedTo(_citizenId);
    uint256 level = Citizen.getLevel(_citizenId);
    if (cityCommittedTo != 0 && level == 0) CannotCommitToCity();

    Citizen.setCityCommittedTo(_citizenId, _cityId);
    incrementGamePoints(_citizenId);
  }

  function claimReward(address _citizenId) public {
    if (_msgSender() != _citizenId) revert InvalidCitizen();

    uint256 level = Citizen.getLevel(_citizenId);
    if (level == 0) CannotClaimReward();
    
    // Check citizenId token balance
    // Transfer tokens to citizenId
    // Check that user balance increased by at least the number of tokens due to them

    Citizen.setGamePoints(_citizenId, 0);
  }


  // ---------------------------------- //
  //             Internal               //
  // ---------------------------------- //
  function incrementGamePoints(address _citizenId) internal {
    uint256 gamePoints = Citizen.getGamePoints(_citizenId);
    uint256 newGamePoints = gamePoints++;
    Citizen.setGamePoints(_citizenId, newGamePoints);
  }

  function incrementVerifiedCities(address _citizenId) internal {
    uint256 verifiedCities = Citizen.getVerifiedCities(_citizenId);
    uint256 newVerifiedCities = verifiedCities++;
    Citizen.setVerifiedCities(_citizenId, newVerifiedCities);
  }
}
