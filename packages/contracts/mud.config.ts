import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
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
