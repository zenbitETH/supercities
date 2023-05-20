import { mudConfig } from "@latticexyz/world/register";
import "@latticexyz/world/snapsync";

export default mudConfig({
  snapSync: true,
  tables: {
    Citizens: {
      schema: {
        verifiedCities: "uint256",
        level: "uint256",
        gamePoints: "uint256",
        cityCommittedTo: "uint256",
        name: "string",
        roleAttestation: "string"
      },
      keySchema: {
        citizen: "address",
      }
    },
    Proposal: {
      schema: {
        citizen: "address",
        proposalTime: "uint256",
        city: "string",
        country: "string"
      },
      keySchema: {
        proposalId: "uint256"
      }
    },
    Cities: {
      schema :{
        city: "string",
        country: "string"
      },
      keySchema: {
        cityId: "uint256"
      }
    }
  },
});
