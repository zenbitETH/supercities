import { mudConfig } from "@latticexyz/world/register";
import "@latticexyz/world/snapsync";

export default mudConfig({
  snapSync: true,
  systems: {
    CitiesSystem: {
      name: "cities",
      openAccess: true
    },
    CitizensSystem: {
      name: "citizens",
      openAccess: true
    },
    SupercitiesSystem: {
      name: "supercities",
      openAccess: true
    },
  },
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
        addedCities: "uint256[]"
      },
      keySchema: {
        citizen: "address",
      }
    },
    CitizensCounter: {
      schema: {
        value: "uint256"
      },
      keySchema: {
        counterId: "bytes32"
      }
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
      schema: {
        value: "uint256"
      },
      keySchema: {
        counterId: "bytes32"
      }
    },
    CitiesCounter: {
      schema: {
        value: "uint256"
      },
      keySchema: {
        counterId: "bytes32"
      }
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
      schema:{
        proposer: "address",
        city: "string",
        country: "string"
      },
      keySchema: {
        cityId: "uint256"
      }
    },
    VerifiedCities: {
      schema: {
        isVerified: "bool"
      },
      keySchema: {
        cityId: "uint256",
        citizen: "address"
      }
    },
    SupercitiesTokenTable: {
      schema: "address"
    },
  },
});
