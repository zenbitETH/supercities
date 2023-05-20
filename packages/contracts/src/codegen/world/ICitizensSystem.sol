// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

interface ICitizensSystem {
  error InvalidCitizen();
  error CitizenAlreadyExists();
  error CityAlreadyVerified();
  error CannotCommitToCity();
  error CannotClaimReward();
  error InvalidVerifiedCities();
  error InvalidLevel();
  error InvalidGamePoints();
  error InvalidCityCommittedTo();

  function addCitizen(
    address _citizen,
    uint256 _verifiedCities,
    uint256 _level,
    uint256 _gamePoints,
    uint256 _cityCommittedTo,
    string memory _name,
    string memory _roleAttestation
  ) external;

  function verifyCity(address _citizen, uint256 _cityId) external;

  function commitToCity(address _citizen, uint256 _cityId) external;

  function claimReward(address _citizen) external;
}
