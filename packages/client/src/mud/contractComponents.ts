/* Autogenerated file. Do not edit manually. */

import { TableId } from "@latticexyz/utils";
import { defineComponent, Type as RecsType, World } from "@latticexyz/recs";

export function defineContractComponents(world: World) {
  return {
    Citizen: (() => {
      const tableId = new TableId("", "Citizen");
      return defineComponent(
        world,
        {
          name: RecsType.String,
          verifiedCities: RecsType.BigInt,
          roleAttestation: RecsType.String,
          level: RecsType.BigInt,
          gamePoints: RecsType.BigInt,
          cityCommittedTo: RecsType.BigInt,
        },
        {
          metadata: {
            contractId: tableId.toHexString(),
            tableId: tableId.toString(),
          },
        }
      );
    })(),
  };
}
