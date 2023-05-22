// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

interface ICitizensSystem {
  error InvalidCitizen();
  error CitizenAlreadyExists();
  error CityAlreadyVerified();
  error CannotCommitToCity();
  error CannotClaimReward();
  error CitizenAlreadyVerifiedCity();
  error UnregisteredCitizen();

  function addCitizen(string memory _name) external;

  function verifyCity(uint256 _cityId) external;

  function commitToCity(uint256 _cityId) external;

  function claimReward(address _citizen) external;
}