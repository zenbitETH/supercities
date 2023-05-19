import { mudConfig } from "@latticexyz/world/register";
import "@latticexyz/world/snapsync";

export default mudConfig({
  snapSync: true,
  tables: {
    Citizen: {
      schema: {
        name: "string",
        verifiedCities: "uint256",
        roleAttestation: "string",
        level: "uint256",
        gamePoints: "uint256",
        cityCommittedTo: "uint256"
      },
      keySchema: {
        citizenId: "address",
      }
    }
  },
});
