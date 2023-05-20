// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { Cities, Proposal, ProposalCounter, Citizens, CitizensCounter } from "../codegen/Tables.sol";

contract CitiesSystem is System {
  error UnregisteredCitizen();

  // ---------------------------------- //
  //             Public                 //
  // ---------------------------------- //
  /// @notice Registered citizens may propose new cities that will be voted on by other citizens
  function proposeCity(address _citizen, string memory _city, string memory _country) public {
    // Check that proposer is a registered citizen
    if (Citizens.getCitizenId(_msgSender()) < 1) revert UnregisteredCitizen();
    uint256 proposalId = incrementProposalCounter();

    Proposal.set(proposalId, _citizen, block.timestamp, 0, 0, _city, _country);
  }

  function upvote(uint256 _proposalId) public {
    if (Citizens.getCitizenId(_msgSender()) < 1) revert UnregisteredCitizen();
    
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