import { mudConfig } from "@latticexyz/world/register";
import "@latticexyz/world/snapsync";

export default mudConfig({
  snapSync: true,
  tables: {
    Citizens: {
      schema: {
        citizenId: "uint256",
        verifiedCities: "uint256",
        level: "uint256",
        gamePoints: "uint256",
        cityCommittedTo: "uint256",
        name: "string",
        roleAttestation: "string",
        proposedCites: "uint256[]"
      },
      keySchema: {
        citizen: "address",
      }
    },
    CitizensCounter: {
      schema: "uint256",
      keySchema: {}
    },
    Proposals: {
      schema: {
        citizen: "address",
        proposalTime: "uint256",
        upvotes: "uint256",
        downvotes: "uint256",
        city: "string",
        country: "string"
      },
      keySchema: {
        proposalId: "uint256"
      }
    },
    ProposalCounter: {
      schema: "uint256",
      keySchema: {}
    },
    CitiesCounter: {
      schema: "uint256",
      keySchema: {}
    },
    Voting: {
      schema: {
        hasVoted: "bool"
      },
      keySchema: {
        proposalId: "uint256",
        citizen: "address"
      }
    },
    Cities: {
      schema :{
        proposer: "address",
        city: "string",
        country: "string",
        committedCitizens: "address[]"
      },
      keySchema: {
        cityId: "uint256"
      }
    }
  },
});
