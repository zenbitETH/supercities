// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

interface ICitiesSystem {
  error UnregisteredCitizen();
  error AlreadyVoted();
  error ExpiredVotingPeriod();
  error InsufficientUpvotes();
  error DownvotesExceedUpvotes();

  function proposeCity(address _citizen, string memory _city, string memory _country) external;

  function upvote(uint256 _proposalId) external;

  function downvote(uint256 _proposalId) external;

  function addCity(uint256 _proposalId) external;
}
