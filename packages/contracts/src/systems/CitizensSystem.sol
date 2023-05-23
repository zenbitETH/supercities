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
  error CannotClaimReward();
  error CitizenAlreadyVerifiedCity();
  error NonregisteredAddress();
  error CannotChangeCityCommitment();

  // ---------------------------------- //
  //             Public                 //
  // ---------------------------------- //

  function addCitizen(
    string memory _name
  ) public {
    if (Citizens.getCitizenId(_msgSender()) != 0) revert CitizenAlreadyExists();
    uint256 citizenId = _incrementCitizensCounter();
    uint256[] memory proposedCities = new uint256[](0);
    // console.log(_msgSender());
    Citizens.set(_msgSender(), citizenId, 0, 0, 0, 0, _name, "", proposedCities);
  }

  function verifyCity(uint256 _cityId) public {
    if (VerifiedCities.get(_cityId, _msgSender())) revert CitizenAlreadyVerifiedCity();
    if (Citizens.getCitizenId(_msgSender()) == 0) revert NonregisteredAddress();

    _incrementGamePoints(_msgSender());
    uint256 gamePoints = Citizens.getGamePoints(_msgSender());
    if (gamePoints >= 6 
      && Citizens.getCityCommittedTo(_msgSender()) > 0
      && Citizens.getLevel(_msgSender()) == 0) {
      Citizens.setLevel(_msgSender(), 1);
    }

    _incrementVerifiedCities(_msgSender());
    VerifiedCities.set(_cityId, _msgSender(), true);
  }

  function commitToCity(uint256 _cityId) public {
    if (Citizens.getCitizenId(_msgSender()) == 0) revert NonregisteredAddress();

    _incrementGamePoints(_msgSender());
    uint256 gamePoints = Citizens.getGamePoints(_msgSender());

    if (Citizens.getCityCommittedTo(_msgSender()) == 0) {
      Citizens.setCityCommittedTo(_msgSender(), _cityId);
      if (gamePoints >= 6 && Citizens.getLevel(_msgSender()) == 0) {
        Citizens.setLevel(_msgSender(), 1);
      }
      return;
    }

    // Level 0 citizens cannot change their committed city
    uint256 level = Citizens.getLevel(_msgSender());
    if (level > 0) {
      Citizens.setCityCommittedTo(_msgSender(), _cityId);
    } else revert CannotChangeCityCommitment();
  }


  function claimReward() public {
    if (Citizens.getCitizenId(_msgSender()) == 0) revert NonregisteredAddress();

    uint256 level = Citizens.getLevel(_msgSender());
    if (level == 0) revert CannotClaimReward();
    
    uint256 tokenAmount = Citizens.getGamePoints(_msgSender());
    Citizens.setGamePoints(_msgSender(), 0);

    _mintTokens(_msgSender(), tokenAmount*10**18);
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
    bytes32 key = SingletonKey;
    uint256 counter = CitizensCounter.get(key);
    uint256 newValue = counter + 1;
    CitizensCounter.set(key, newValue);
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
