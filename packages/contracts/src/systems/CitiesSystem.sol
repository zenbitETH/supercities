// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { Cities, Proposals, ProposalCounter, Citizens, CitizensCounter, Voting } from "../codegen/Tables.sol";

contract CitiesSystem is System {
  error UnregisteredCitizen();
  error AlreadyVoted();
  error ExpiredVotingPeriod();

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



  function addCity() public {
    // cannot be more than a week past the proposal
    // must have 3 upvotes
    // must have more upvotes than downvotes
    // anyone can call this function


    
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