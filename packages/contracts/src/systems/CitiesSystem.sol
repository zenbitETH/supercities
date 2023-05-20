// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { Cities, Proposals, ProposalCounter, Citizens, CitizensCounter, Voting, CitiesCounter } from "../codegen/Tables.sol";

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
  function proposeCity(address _citizen, string memory _city, string memory _country) public {
    // Check that proposer is a registered citizen
    if (Citizens.getCitizenId(_msgSender()) < 1) revert UnregisteredCitizen();
    uint256 proposalId = incrementProposalCounter();

    Proposals.set(proposalId, _citizen, block.timestamp, 0, 0, _city, _country);
  }

  function upvote(uint256 _proposalId) public {
    if (Citizens.getCitizenId(_msgSender()) < 1) revert UnregisteredCitizen();
    if (Voting.get(_proposalId, _msgSender())) revert AlreadyVoted();

    uint256 upvotes = Proposals.getUpvotes(_proposalId);
    uint256 newUpvotes = upvotes++;
    Proposals.setUpvotes(_proposalId, newUpvotes);
    // Prevent the same citizen from voting on the same proposal twice
    Voting.set(_proposalId, _msgSender(), true);
  }

  function downvote(uint256 _proposalId) public {
    if (Citizens.getCitizenId(_msgSender()) < 1) revert UnregisteredCitizen();
    if (Voting.get(_proposalId, _msgSender())) revert AlreadyVoted();

    uint256 downvotes = Proposals.getDownvotes(_proposalId);
    uint256 newDownvotes = downvotes++;
    Proposals.setDownvotes(_proposalId, newDownvotes);
    // Prevent the same citizen from voting on the same proposal twice
    Voting.set(_proposalId, _msgSender(), true);
  }


  /// @notice Within 7 days of having been proposed, if a proposed city has more than 3 upvotes and if there are more upvotes than downvotes, then anyone can call this function to add the city to the Cities table.
  function addCity(uint256 _proposalId) public {
    // City must be added within one week from when it was proposed
    uint256 proposalTime = Proposals.getProposalTime(_proposalId);
    if (block.timestamp > proposalTime + 604800) revert ExpiredVotingPeriod();
    // must have 3 upvotes
    uint256 upvotes = Proposals.getUpvotes(_proposalId);
    if (upvotes < 3) revert InsufficientUpvotes();
    // must have more upvotes than downvotes
    uint256 downvotes = Proposals.getDownvotes(_proposalId);
    if (downvotes >= upvotes) revert DownvotesExceedUpvotes();

    string memory city = Proposals.getCity(_proposalId);
    string memory country = Proposals.getCountry(_proposalId);
    uint256 currentCityId = CitiesCounter.get();
    uint256 newCityId = currentCityId++;
    address proposer = Proposals.getCitizen(_proposalId);
    Cities.set(newCityId, proposer, city, country);

    CitiesCounter.set(newCityId);

    Citizens.pushProposedCites(proposer, newCityId);

    // REWARD PROPOSER WITH TOKENS
    
  }


  // ---------------------------------- //
  //             Internal               //
  // ---------------------------------- //
  function incrementProposalCounter() internal returns (uint256) {
    uint256 counter = ProposalCounter.get();
    uint256 newValue = counter + 1;
    ProposalCounter.set(newValue);
    return newValue;
  }
}