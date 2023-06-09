// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { console } from "forge-std/console.sol";
import { System } from "@latticexyz/world/src/System.sol";
import { Cities, Proposals, ProposalCounter, Citizens, CitizensCounter, Voting, CitiesCounter, SupercitiesTokenTable } from "../codegen/Tables.sol";
import { SupercitiesToken } from "../SupercitiesToken.sol";

bytes32 constant SingletonKey = bytes32(uint256(0x060D));

contract CitiesSystem is System {
  error UnregisteredCitizen();
  error AlreadyVoted();
  error ExpiredVotingPeriod();
  error InsufficientUpvotes();
  error DownvotesExceedUpvotes();

  // ---------------------------------- //
  //             Public                 //
  // ---------------------------------- //
  /// @notice Registered citizens may propose new cities that will be voted on by other citizens
  function proposeCity(string memory _city, string memory _country) public {
    // Check that proposer is a registered citizen
    if (Citizens.getCitizenId(_msgSender()) == 0) revert UnregisteredCitizen();
    uint256 proposalId = incrementProposalCounter();
    Proposals.set(proposalId, _msgSender(), block.timestamp, 0, 0, _city, _country);
  }

  function upvote(uint256 _proposalId) public {
    if (Citizens.getCitizenId(_msgSender()) == 0) revert UnregisteredCitizen();
    if (Voting.get(_proposalId, _msgSender())) revert AlreadyVoted();

    uint256 upvotes = Proposals.getUpvotes(_proposalId);
    uint256 newUpvotes = upvotes + 1;
    Proposals.setUpvotes(_proposalId, newUpvotes);
    // Prevent the same citizen from voting on the same proposal twice
    Voting.set(_proposalId, _msgSender(), true);
    uint256 up = Proposals.getUpvotes(1);
  }

  function downvote(uint256 _proposalId) public {
    if (Citizens.getCitizenId(_msgSender()) == 0) revert UnregisteredCitizen();
    if (Voting.get(_proposalId, _msgSender())) revert AlreadyVoted();

    uint256 downvotes = Proposals.getDownvotes(_proposalId);
    uint256 newDownvotes = downvotes + 1;
    Proposals.setDownvotes(_proposalId, newDownvotes);
    // Prevent the same citizen from voting on the same proposal twice
    Voting.set(_proposalId, _msgSender(), true);
  }

  /// @notice FOR TESTING, ONLY ONE UPVOTE IS NEEDED.  THIS SHOULD BE SET TO 3 FOR PRODUCTION
  /// @notice Within 7 days of having been proposed, if a proposed city has more than 3 upvotes and if there are more upvotes than downvotes, then anyone can call this function to add the city to the Cities table.
  /// @notice Caller must pay gas, which includes minting tokens if the city is added successfully.
  function addCity(uint256 _proposalId) public {
    // City must be added within one week from when it was proposed
    uint256 proposalTime = Proposals.getProposalTime(_proposalId);
    if (block.timestamp > proposalTime + 604800) revert ExpiredVotingPeriod();
    // must have 3 upvotes
    uint256 upvotes = Proposals.getUpvotes(_proposalId);
    if (upvotes < 1) revert InsufficientUpvotes();
    // must have more upvotes than downvotes
    uint256 downvotes = Proposals.getDownvotes(_proposalId);
    if (downvotes >= upvotes) revert DownvotesExceedUpvotes();

    string memory city = Proposals.getCity(_proposalId);
    string memory country = Proposals.getCountry(_proposalId);
    bytes32 key = SingletonKey;
    uint256 currentCityId = CitiesCounter.get(key);
    uint256 newCityId = currentCityId + 1;
    address proposer = Proposals.getCitizen(_proposalId);
    Cities.set(newCityId, proposer, city, country);

    CitiesCounter.set(key, newCityId);
    Citizens.pushAddedCities(proposer, newCityId);
    // Proposer gets rewarded with 1 token
    _mintTokens(proposer, 1*10**18);  
  }


  // ---------------------------------- //
  //             Internal               //
  // ---------------------------------- //
  function incrementProposalCounter() internal returns (uint256) {
    bytes32 key = SingletonKey;
    uint256 counter = ProposalCounter.get(key);
    uint256 newValue = counter + 1;
    ProposalCounter.set(key, newValue);
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